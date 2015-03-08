class HumanSerializer < ActiveModel::Serializer
  # self.per_page = 2

  # filter #(optional) - Filters are used to narrow down the events used in an analysis request based on event property values.
  # timeframe #(optional) - A Timeframe specifies the events to use for analysis based on a window of time.
  # property_names #(optional) - A URL-encoded array of strings containing properties you wish to extract. If this parameter is omitted, all properties will be returned.

  # cache key: 'posts', expires_in: 3.hours
  attributes :id, :username, :karma, :about, :created_at, :updated_at, :item_votes

  has_many :items

  has_many :votes

  has_many :item_comments

  def item_votes
    votes.where(votable_type: "Item")
  end

  #
  # url :post
end
