module UserItemVotesHelper
  def link_to_upvote(object)
    link_to 'like!', vote_item_path(object), method: :post, class: 'text-danger'
  end

  def link_to_downvote(object)
    link_to 'unlike!', vote_item_path(object), method: :delete, class: 'text-muted'
  end

  def render_votes_for_item(item=nil)
    if current_user && @votes[item.id].include?(current_user.id)
      link_to_downvote(item)
    else
      link_to_upvote(item)
    end
  end

  def render_link_to_user(user, options={})
    if user.disabled?
      user.username
    else
      link_to user.username, user, options
    end
  end
end
