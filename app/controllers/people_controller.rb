class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :update, :edit, :destroy, :my_exhibitions]
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
    if @person.delete
      flash[:notice] = 'Person has been deleted.'
      redirect_to people_path
    else
    end
  end

  private
  def person_params
    params.require(:person).permit(:name, :date_of_birth, :sex, :country)
  end

  def set_exhibitions
     @exhibitions = Exhibition.where(id: (Enrolment.select(:exhibition_id).where(dog_id: Dog.where(person_id: current_user))))
  end

  def set_person
    @person = Person.find(params[:id])
  end
end

