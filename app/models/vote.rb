class Vote < ActiveRecord::Base
  belongs_to :votable, polymorphic: true
  belongs_to :user

  validates_uniqueness_of :votable_id, scope: [:user_id, :votable_type]

  after_create do
    update_votes
  end

  after_destroy do
    update_votes
  end

  def get_object
    return @object if @object && @object.valid?
    klass = votable_type.constantize
    return false unless klass.exists?
    @object = klass.find(votable_id)
  end

  def update_votes
    attrs = self.attributes.with_indifferent_access.slice(:votable_id, :votable_type)
    count = Vote.where(attrs).count
    item = get_object

    # Hot Score is a function defined inside:
    # db/migrate/20150405200823_add_hot_score_function.rb

    rank = item.class.where(id: item.id)
             .select("id, hot_score(#{count}, 0, created_at) as hot_score")
             .first.hot_score.to_i

    item.update(
      downvotes_count: 0,
      upvotes_count: count,
      score: count,
      rank: rank
    )
  end
end
