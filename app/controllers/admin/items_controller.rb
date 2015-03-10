class Admin::ItemsController < ApplicationController
  before_action do
    current_admin = !!(current_user && current_user.admin?)
    unless current_admin
      redirect_to root_path, alert: "Unauthorized."
      return
    end
  end
  before_action :set_admin_item, only: [:show, :edit, :update, :destroy]

  def index
    @admin_items = Item.all
  end

  def show
  end

  def new
    @admin_item = Item.new
  end

  def edit
  end

  def create
    @admin_item = Item.new(admin_item_params)

    if @admin_item.save
      redirect_to @admin_item, notice: 'Item was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @admin_item.update(admin_item_params)
      redirect_to @admin_item, notice: 'Item was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @admin_item.destroy
    redirect_to admin_items_url
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_admin_item
    @admin_item = Item.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def admin_item_params
    params[:admin_item].permit!
  end
end
