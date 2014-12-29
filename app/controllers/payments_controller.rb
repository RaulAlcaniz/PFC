class PaymentsController < ApplicationController
  before_action :set_exhibition, only: [:new, :create]
  before_action :set_person, only: [:new, :create]
  before_action :set_enrolments, only: [:new, :create]
  before_action :set_price, only: [:new, :create]
  before_action :set_dogs, only: [:new, :create]

  def new
    @payment = Payment.new
  end

  def create
    @payment = Payment.new(payment_params)

    begin
      update_enrolments
    rescue Exception => ex
      flash[:alert] = ex.message
      render 'new'
      return
    end

    if @payment.save
      update_enrolments
      @payment.unverified!
      flash[:notice] = 'Payment has been uploaded.'
      redirect_to exhibition_enrolments_path(@exhibition)
    else
      flash[:alert] = 'Payment has not been uploaded'
      render 'new'
    end
  end

  private
  def payment_params
    params.require(:payment).permit(:amount, :comment)
  end

  def set_exhibition
    @exhibition = Exhibition.find(params[:exhibition_id])
  end

  def set_enrolments
    @enrolments = []
    @exhibition.enrolments.find_all{|enrolment|
      @person.dogs.each{|dog| @enrolments << enrolment if (dog.id == enrolment.dog_id and !enrolment.payment_id)}
    }
  end

  def set_price
    @price = @enrolments.map{|enrolment| enrolment.price}.inject(0,:+)
  end

  def set_person
    @person = Person.find_by_user_id(current_user.id)
  end

  def set_dogs
    @dogs = []
    @enrolments.each do |enrolment|
      @dogs << Dog.find(enrolment.dog_id).name
    end
  end

  def update_enrolments
    raise 'You have dogs already enrolled in this exhibition and you have paid for it' if @enrolments.empty?
    @enrolments.each do |enrolment|
      raise 'You have dogs already enrolled in this exhibition and you have paid for it' if not enrolment.payment_id.blank?
      if @payment.id
        Enrolment.all.find_all{|entries| entries.id == enrolment.id}.each{|entry_to_update|
          entry_to_update.update_attribute(:payment_id, @payment.id)
        }
      end
    end

  end
end
