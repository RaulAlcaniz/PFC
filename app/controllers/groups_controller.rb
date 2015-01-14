class GroupsController < ApplicationController

  before_filter :authenticate_user!, :except => [:show, :index]
  before_action :set_group, only: [:show, :edit, :update, :destroy]
  before_action :set_person, only: [:new, :create, :update, :edit, :destroy]
  before_action :authorize_admin, only: [:new, :create, :update, :edit, :destroy]

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

    def set_person
      @person = Person.find_by_user_id(current_user.id)
    end

    def authorize_admin
      raise(ActiveRecord::RecordNotFound) if not User.find(@person.user_id).admin?
      rescue ActiveRecord::RecordNotFound
        flash[:alert] = 'You can\'t access to this page.'
        redirect_to root_path
    end
end
