module UserItemVotesHelper
  def link_to_upvote(object)
    link_to 'like!', vote_item_path(object), method: :post
  end

  def link_to_downvote(object)
    link_to 'unlike!', vote_item_path(object), method: :delete
  end

  def render_votes_for_item(item)
    if @votes[item.id].include?(current_user.id)
      link_to_downvote(item)
    else
      link_to_upvote(item)
    end
  end
end
