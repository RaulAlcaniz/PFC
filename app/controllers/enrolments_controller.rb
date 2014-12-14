class EnrolmentsController < ApplicationController
  before_action :set_exhibition, only: [:new, :create, :index, :destroy]
  before_action :set_enrolment, only: [:destroy]
  before_action :set_person, only: [:new, :create, :index]
  before_action :set_price, only: [:new, :create]

  def new
    @enrolment = @exhibition.enrolments.new
  end

  def index
    @enrolments = []

    @exhibition.enrolments.find_all{|enrolment|
      @person.dogs.each{|dog| @enrolments << enrolment if dog.id == enrolment.dog_id}
    }
    @enrolments_price = @enrolments.map{|enrolment| enrolment.price}.inject(0,:+)

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
      update_price
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
    #begin
    #  is_logged?
    #rescue Exception => ex
    #  flash[:alert] = ex.message
    #  @price = -1
    #  render 'exhibitions/show'
    #  return
    #end
    @person = Person.find_by_user_id(current_user.id)
  end

  #def is_logged?
  #  raise 'You should be log in to do this action' if current_user == nil
  #end

  def set_enrolment
    @enrolment = Enrolment.find(params[:id])
  end

  def set_price
    @price = -1
    if @enrolment
      today = Date.today.strftime('%d/%m/%Y')
      #today = '10-01-2015'   # Linea  a quitar cuando esto esté bien.

      prices = (@exhibition.exhibition_prices today, @enrolment.dog_class, 'nopartners') if @enrolment.partner == 0
      prices = (@exhibition.exhibition_prices today, @enrolment.dog_class, 'partners') if @enrolment.partner == 1
      raise "#{prices}" if prices.include? 'ERROR'

      number_of_dogs = @enrolment.how_many_dogs_for_this_exhibition(@exhibition.what_classes_has(@enrolment.dog_class), @enrolment.dog_owner)

      if number_of_dogs >= prices.count
        @price = prices.last
      else
        @price = prices[number_of_dogs]
      end
    end
  end

  def update_price
    date = @enrolment.created_at.strftime('%d/%m/%Y')
    prices = (@exhibition.exhibition_prices date, @enrolment.dog_class, 'nopartners') if @enrolment.partner == 0
    prices = (@exhibition.exhibition_prices date, @enrolment.dog_class, 'partners') if @enrolment.partner == 1
    grouped_classes = @exhibition.what_classes_has(@enrolment.dog_class)
    owner_id = @enrolment.dog_owner
    Enrolment.order(:created_at).find_all{|enrolment| enrolment.dog_owner == owner_id}.
        find_all{|enrolment| grouped_classes.include? "#{enrolment.dog_class}"}.
        each_with_index{|enrolment, index|
      enrolment.update_attribute(:price, prices[index])  if index < prices.count
      enrolment.update_attribute(:price, prices.last)  if index >= prices.count
    }
  end

  def enrolment_params
    #params.permit({enrolment: [:dog_id, :partner]}, :dog_class)
    params.require(:enrolment).permit(:dog_id, :partner, :dog_class, :price)
  end
end
