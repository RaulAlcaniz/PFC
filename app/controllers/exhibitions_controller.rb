class ExhibitionsController < ApplicationController
  require 'builder'

  before_filter :authenticate_user!, :except => [:show, :index]
  before_action :set_exhibition, only: [:show, :destroy, :edit, :update, :destroy]
  before_action :set_person, only: [:new, :create, :update, :edit, :destroy]
  before_action :authorize_admin, only: [:new, :create, :update, :edit, :destroy]

  def new
    @exhibition = Exhibition.new
  end

  def index
    @exhibitions = Exhibition.all
    @person = Person.find_by_user_id(params[:user]) if User.find(current_user).admin?
  end

  def create
    @exhibition = Exhibition.new(exhibition_params)
    if @exhibition.save
      flash[:notice] = 'Exhibition has been created.'
      redirect_to @exhibition
    else
      flash[:alert] = 'Exhibition has not been created.'
      render 'new'
    end
  end

  def update
    if @exhibition.update_attributes(exhibition_params)
      flash[:notice] = 'Exhibition has been updated.'
      redirect_to @exhibition
    else
      flash[:alert] = 'Exhibition has not been updated.'
      render 'edit'
    end
  end

  def destroy
    if @exhibition.destroy
      flash[:notice] = 'Exhibition has been deleted.'
      redirect_to exhibitions_path
    else
    end
  end

  private
  def set_exhibition
    @exhibition = Exhibition.find(params[:id])
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

  def exhibition_params
    params.require(:exhibition).permit(:name, :description, :start_date, :end_date)
  end
end
