class DogsController < ApplicationController

  before_action :set_person, only: [:new, :create]
  before_action :set_dog, only: [:show]
  #before_action :set_breeds, only: [:new, :create]

  def new
    @dog = @person.dogs.new
  end

  def create
    #dogable_params = params[:dog][:dogable].match(/^(?<type>\w+):(?<id>\d+)$/)
    #puts "ASD", params[:dog][:dogable]
    #params[:dog].delete(:dogable)
    puts "HOLA", params[:dog][:variety_id]
    @dog = @person.dogs.build(dog_params)
    #@dog.dogable_id = dogable_params[:id]
    #@dog.dogable_type = dogable_params[:type]

    if @dog.save
      flash[:notice] = 'Dog has been created.'
      redirect_to [@person, @dog]
    else
      flash[:alert] = 'Dog has not been created.'
      render 'new'
    end
  end

  def update_varieties_select
    varieties = Variety.where(:breed_id => params[:id]).order(:name) unless params[:id].blank?
    #puts varieties.to_yaml
    render :partial => 'varieties', :locals => { :varieties => varieties }
  end

  def update_subvarieties_select
    subvarieties = Subvariety.where(:variety_id => params[:id]).order(:name) unless params[:id].blank?
    render :partial => "subvarieties", :locals => { :subvarieties => subvarieties }
  end

  private
  def set_person
    @person = Person.find(params[:person_id])
  end

  def set_dog
    @dog = Dog.find(params[:id])
  end

#  def set_breeds
#    @breeds = Breed.all
#    @varieties = Variety.all
#    @subvarieties = Subvariety.all
#  end

  def dog_params
    params.require(:dog).permit(:name, :titles, :sire, :dam, :sex, :date_of_birth, :dogable_id, :variety_id, :subvariety_id)
  end


end
