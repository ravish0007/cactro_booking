class BookingsController < ApplicationController

  before_action :verify_user_role, except: [:index, :show]
  before_action :find_booking, only: [:show]
  before_action :find_ticket, only: [:create]

  def index
    @bookings  = Booking.all
    render json: @bookings
  end 

  def show
    render json: @booking
  end

  def create
    Booking.transaction do
      ticket = Ticket.lock.find(@ticket.id)
      if ticket.remaining > 0
        ticket.update!(remaining: ticket.remaining - 1)
        Booking.create!(user: @user, ticket: ticket)
        EmailConfirmationJob.perform_later(@user, ticket)
        render json: { message: "Booking created successfully" }, status: :created
      else
        render json: {errors: 'tickets sold out'}, status: :unprocessable_entity
      end
    end
  end



  private
  
  def ticket_sold_out?
    @ticket.remaining == 0
  end

  def find_booking
    begin
      @booking = Booking.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: {errors: 'booking not found'}, status: :not_found
    end
  end

  def find_ticket
    begin
      @ticket = Ticket.find(params[:ticket_id])
      if ticket_sold_out?
        render json: {errors: 'tickets sold out'}, status: :unprocessable_entity
      end
    rescue ActiveRecord::RecordNotFound
      render json: {errors: 'ticket not found'}, status: :not_found
    end
  end
end










  


