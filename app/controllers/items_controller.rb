class ItemsController < ApplicationController
  before_action :require_login, only: [:new, :create, :edit, :update, :toggle]
  before_action :set_item, only: [:show]
  before_action :set_user_item, only: [:edit, :update, :toggle]

  def index
    order = params[:newest] ? {created_at: :desc} : {rank: :desc}

    @items = Item.order(order).includes(:user)
    @votes = @items.includes(:votes).each_with_object({}) do |item, object|
      object[item.id] = item.votes.map(&:user_id)
    end
  end

  def show
    @comments = @item.comments.includes(:user).order(created_at: :asc)
  end

  def new
    @item = Item.new
  end

  def edit
  end

  def create
    @item = current_user.items.build(item_params)

    if @item.save
      redirect_to @item, notice: 'Item was successfully created.'
    else
      render :new
    end
  end

  def update
    if @item.update(item_params)
      redirect_to @item, notice: 'Item was successfully updated.'
    else
      render :edit
    end
  end

  def toggle
    @item.update(:disabled, @item.disabled?)
    message = item.disabled? ? 'disabled' : 'enabled'
    redirect_to @item, notice: "Item #{message}."
  end

  private
  def set_item
    @item = Item.includes(:votes).find(params[:id])
    @votes = [@item].each_with_object({}) do |item, object|
      object[item.id] = item.votes.map(&:user_id)
    end
  end

  def set_user_item
    @item = current_user.items.find(params[:id])
    unless @item
      redirect_to :back, notice: 'Unauthorized'
      return
    end
  end

  def item_params
    params.require(:item).permit(:title, :url, :content)
  end
end
