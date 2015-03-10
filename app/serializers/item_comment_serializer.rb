class ItemCommentSerializer < ActiveModel::Serializer
  # self.per_page = 1

  # has_scope :newest, type: :boolean
  # has_scope :disabled, type: :boolean
  # has_scope :by_degree
  # has_scope :by_period, :using => [:started_at, :ended_at], :type => :hash


  # filter #(optional) - Filters are used to narrow down the events used in an analysis request based on event property values.
  # timeframe #(optional) - A Timeframe specifies the events to use for analysis based on a window of time.
  # property_names #(optional) - A URL-encoded array of strings containing properties you wish to extract. If this parameter is omitted, all properties will be returned.

  # cache key: 'posts', expires_in: 3.hours
  attributes :id, :content, :user_id, :item_id, :created_at, :updated_at
end
