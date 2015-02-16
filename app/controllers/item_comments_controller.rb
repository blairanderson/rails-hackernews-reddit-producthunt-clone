class ItemCommentsController < ApplicationController
  before_action :set_item

  def index
    @comments = @item.comments.order(created_at: :asc)
  end

  def create
    @comment = current_user.item_comments.build(comment_params)
    if @comment.save
      redirect_back_or_to item_path(@item), notice: "Success."
    else
      redirect_back_or_to item_path(@item), notice: @comment.errors.full_messages.join(". ")
    end
  end

  def update
  end

  def destroy
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
    return redirect_back_or_to root_path, notice: 'could not find item' unless @item
  end

  def comment_params
    params.require(:item_comment).permit(:content).merge({item_id: params[:item_id]})
  end
end
