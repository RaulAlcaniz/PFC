class EnrolmentsController < ApplicationController
  #before_action :set_person, only: [:new, :create, :index, :show, :destroy, :edit, :update]
  before_action :set_exhibition, only: [:new, :create, :index]
  before_action :set_enrolment, only: [:destroy]
  before_action :set_person, only: [:new, :create, :index]
  before_action :set_price, only: [:new, :create]

  def new
    @enrolment = @exhibition.enrolments.new
  end

  def index
    @enrolments = []
      @exhibition.enrolments.all.find_all{|enrolment| enrolment.dog_id == Dog.all.where(:person_id == @person.id)
      @enrolments << enrolment}
    @enrolments_price = @enrolments.map{|enrolment| enrolment.price}.inject(0,:+)

    #@enrolments.each do |enrolment|
    #  @enrolments_price += enrolment.price
    #end
  end

  def create
    @enrolment = @exhibition.enrolments.build(enrolment_params)

    if @enrolment[:price] < 0 && @enrolment.valid?
      begin
        set_price
      rescue Exception => ex
        flash[:alert] = ex.message
        @price = -1
        render 'new'
        return
      end
      flash[:notice] = 'Confirm your inscription for the price showed below'
      render 'new'
    elsif @enrolment.save
      flash[:notice] = 'Inscription has been created.'
      redirect_to exhibition_enrolments_path
    else
      flash[:alert] = 'Inscription has not been created.'
      render 'new'
    end
  end

  def destroy
    if @enrolment.destroy
      flash[:notice] = 'Enrolment has been deleted.'
      redirect_to exhibition_enrolments_path
    else
    end
  end

  private

  def set_exhibition
    @exhibition = Exhibition.find(params[:exhibition_id])
  end

  def set_person
    @person = Person.find_by_user_id(current_user.id)
  end

  def set_enrolment
    @enrolment = Enrolment.find(params[:id])
  end

  def set_price
    @price = -1
    if @enrolment
      hoy = Date.today.strftime('%d/%m/%Y')
      #hoy = '10-01-2015'   # Linea  a quitar cuando esto esté bien.

      prices = (@exhibition.partners_prices hoy, @enrolment.dog_class, 'nopartners') if @enrolment.partner == 0
      prices = (@exhibition.partners_prices hoy, @enrolment.dog_class, 'partners') if @enrolment.partner == 1
      raise "#{prices}" if prices.include? 'ERROR'
      #puts @enrolment.to_yaml

      number_of_dogs = @enrolment.how_many_dogs_for_this_exhibition(@exhibition.what_classes_has(@enrolment.dog_class), @enrolment.dog_owner)
      if number_of_dogs >= prices.count
        @price = prices.last
      else
        @price = prices[number_of_dogs]
      end
    end
  end

  def enrolment_params
    #params.permit({enrolment: [:dog_id, :partner]}, :dog_class)
    params.require(:enrolment).permit(:dog_id, :partner, :dog_class, :price)
  end
end
