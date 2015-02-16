class ItemsController < ApplicationController
  before_action :require_login, only: [:new, :create, :edit, :update, :toggle]
  before_action :set_item, only: [:show]
  before_action :set_user_item, only: [:edit, :update, :toggle]

  swagger_controller :items, "Item Management"

  swagger_api :index do
    summary "Fetches all Current items"
    notes "This lists items"
    # param :query, :page, :integer, :optional, "Page number"
    # param :path, :nested_id, :integer, :optional, "Team Id"
    # response :unauthorized
    # response :not_acceptable, "The request you made is not acceptable"
    # response :requested_range_not_satisfiable
  end
  def index
    @items = Item.order(score: :desc).includes(:user)
  end

  def show
    @comments = @item.comments.includes(:user).order(created_at: :asc)
  end

  # GET /items/new
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
    @item = Item.find(params[:id])
  end

  def set_user_item
    @item = current_user.items.find(params[:id])
    return redirect_to :back, notice: 'Unauthorized' unless @item
  end

  def item_params
    params.require(:item).permit(
      :title,
      :url
    )
  end
end
