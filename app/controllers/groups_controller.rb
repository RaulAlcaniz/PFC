class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]

  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      flash[:notice] = 'Group has been created.'
      redirect_to @group
    else
      flash[:alert] = 'Group has not been created.'
      render 'new'
    end
  end

  def update
    if @group.update_attributes(group_params)
      flash[:notice] = 'Group has been updated.'
      redirect_to @group
    else
      flash[:alert] = 'Group has not been updated.'
      render 'edit'
    end
  end

  def destroy
    if @group.destroy
      flash[:notice] = 'Group has been deleted.'
      redirect_to groups_path
    else
    end
  end

  private
    def group_params
      params.require(:group).permit(:name, :description)
    end

    def set_group
      @group = Group.find(params[:id])
    end
end
