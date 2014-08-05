class PeopleController < ApplicationController

  def new
    @person = Person.new
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

  private
  def person_params
    params.require(:person).permit(:name, :date_of_birth, :sex, :country)
  end

end

