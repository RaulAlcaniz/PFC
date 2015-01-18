class PeopleController < ApplicationController

  before_filter :authenticate_user!
  before_action :set_person, only: [:show, :update, :edit, :destroy, :my_exhibitions]
  before_action :authorized_people, only: [:show, :update, :edit, :destroy, :my_exhibitions]
  before_action :authorize_admin, only: [:new, :create, :index]
  before_action :set_exhibitions, only:[:my_exhibitions]

  def new
    @person = Person.new
  end

  def index
    @people = Person.all
  end

  def create
    @person = Person.new(person_params)
    if @person.save
      flash[:notice] = 'Person has been created.'
      redirect_to @person
    else
      flash[:alert] = 'Person has not been created.'
      render 'new'
    end
  end

  def update
    if @person.update_attributes(person_params)
      flash[:notice] = 'Person has been updated.'
      redirect_to @person
    else
      flash[:notice] = 'Person has not been updated.'
      render 'edit'
    end
  end

  def destroy
    if User.find(current_user).admin? and @person.id == current_user.id
      flash[:notice] = 'You can\'t delete yourself as admin'
      redirect_to @person
    else
      if @person.delete
        flash[:notice] = 'Person has been deleted.'
        if User.find(current_user).admin?
          redirect_to people_path
        else
          redirect_to root_path
        end
      end
    end
  end

  private
  def person_params
    params.require(:person).permit(:name, :date_of_birth, :sex, :country)
  end

  def set_exhibitions
     @exhibitions = Exhibition.where(id: (Enrolment.select(:exhibition_id).where(dog_id: Dog.where(person_id: params[:id]))))
  end

  def set_person
    @person = Person.find(params[:id])
  end

  def authorized_people
    if @person.user_id != current_user.id
      raise(ActiveRecord::RecordNotFound) if not User.find(current_user).admin?
    end
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = 'You can\'t access to this page.'
      redirect_to root_path
  end

  def authorize_admin
    raise(ActiveRecord::RecordNotFound) if not User.find(current_user).admin?
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = 'You can\'t access to this page.'
    redirect_to root_path
  end
end

