module UserItemVotesHelper
  def link_to_upvote(object)
    link_to 'up', vote_item_path(object), method: :post
  end

  def link_to_downvote(object)
    link_to 'down', vote_item_path(object), method: :delete
  end

  def render_votes_for_item(item)
    [
      link_to_upvote(item),
      link_to_downvote(item)
    ].join('/').html_safe
  end
end
