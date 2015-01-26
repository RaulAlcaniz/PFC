class EnrolmentsController < ApplicationController

  before_filter :authenticate_user!
  before_action :set_exhibition, only: [:new, :create, :index, :destroy]
  before_action :check_deadlines, only: [:new, :create]
  before_action :set_enrolment, only: [:destroy]
  before_action :set_person, only: [:new, :create, :index, :destroy]
  before_action :set_price, only: [:new, :create]
  before_action :authorized_people
  before_action :authorize_route

  def new
    @enrolment = @exhibition.enrolments.new
  end

  def index
    @unpaid_enrolments = []
    @paid_enrolments = []
    @enrolments_index = []
    @out_of_time = false

    @exhibition.enrolments.find_all{|enrolment|
      @person.dogs.each{|dog|
        partner = 'undefined'
        if enrolment.partner?
          partner = 'partners'
        else
          partner = 'nopartners'
        end
        if (dog.id == enrolment.dog_id and !enrolment.payment_id and
            !((@exhibition.exhibition_prices enrolment.created_at.strftime('%d/%m/%Y'), enrolment.dog_class, partner).is_a? String))
          @unpaid_enrolments << enrolment if (Date.today <= @exhibition.end_date) # Enrolments not payed at the end of the exhibition are not displayed
          @out_of_time = true if (@exhibition.exhibition_prices Date.today.strftime('%d/%m/%Y'), enrolment.dog_class, partner).include? 'ERROR'
        end   #if ((Date.today - enrolment.created_at.to_date).to_i < 15)
      }
    }
    @enrolments_price = @unpaid_enrolments.map{|enrolment| enrolment.price}.inject(0,:+)

    @enrolments_index = @exhibition.enrolments.where(dog_id: Dog.all.ids).group(:payment_id).collect(&:id)

    #@enrolments_index = @exhibition.enrolments.group(:payment_id).collect(&:id)

    @exhibition.enrolments.order('payment_id').order('created_at DESC').
        where(payment_id: @exhibition.enrolments.group(:payment_id).
                  collect(&:payment_id)).find_all{|enrolment|
                    @person.dogs.each{|dog|
                      @paid_enrolments << enrolment if (dog.id == enrolment.dog_id and enrolment.payment_id)}
    }
  end

  def create
    @enrolment = @exhibition.enrolments.build(enrolment_params)
    if @enrolment[:price] < 0 && @enrolment.valid?
       begin
        set_price
       rescue Exception => ex
         flash[:alert] = ex.message
         @price = -1
         redirect_to exhibition_enrolments_path
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
    if User.find(current_user).admin?
      @person = Person.find_by_id(params[:person_id])
    else
      @person = Person.find_by_user_id(current_user.id)
    end
  end

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

      number_of_dogs = @enrolment.how_many_dogs_for_this_exhibition(@exhibition.what_classes_has(@enrolment.dog_class),
                                                                    @enrolment.dog_owner, @exhibition.id)
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

    raise(ActiveRecord::ActiveRecordError) if prices.include? 'ERROR'

    grouped_classes = @exhibition.what_classes_has(@enrolment.dog_class)
    owner_id = @enrolment.dog_owner
    Enrolment.order(:created_at).find_all{|enrolment| enrolment.dog_owner == owner_id}.
        find_all{|enrolment| grouped_classes.include? "#{enrolment.dog_class}"}.
        find_all{|enrolment| enrolment.exhibition_id == @exhibition.id}.
        each_with_index{|enrolment, index|
      enrolment.update_attribute(:price, prices[index])  if index < prices.count
      enrolment.update_attribute(:price, prices.last)  if index >= prices.count
    }
  end

  def enrolment_params
    params.require(:enrolment).permit(:dog_id, :partner, :dog_class, :price)
  end

  def authorized_people
    if @person.try(:user_id) != current_user.id
      raise(ActiveRecord::RecordNotFound) if (!User.find(current_user).admin?) or (User.find(current_user).admin? and !params.has_key?(:person_id))
    end
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = 'You can\'t access to this page.'
    redirect_to root_path
  end

  def authorize_route
    if params[:person_id]
      raise(ActiveRecord::RecordNotFound) if !User.find(current_user.id).admin?
      @person = Person.find(params[:person_id]) if params[:person_id]
    end
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = 'You can\'t access to this page.'
    redirect_to root_path
  end

  def check_deadlines
    raise(ActiveRecord::ActiveRecordError) if !@exhibition.try(:payment_time_started?) or @exhibition.try(:payment_time_ended?)

  rescue ActiveRecord::ActiveRecordError
    flash[:alert] = 'This exhibition is not available to enroll at the moment.'
    redirect_to @exhibition
  end
end
