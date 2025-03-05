class TicketsController < ApplicationController

  before_action :verify_organizer_role, except: [:index, :show]
  before_action :find_ticket, only: [:show]
  before_action :find_organizers_ticket, only: [:update, :destroy]
  before_action :find_organizers_event, only: [:create]

  def index
    @tickets  = Tickets.all
    render json: @tickets
  end 

  def show
    render json: @ticket
  end

  def create
    @ticket = @event.tickets.build(ticket_params)
    if @ticket.save
      render json: @ticket, status: :created
    else
      render json: {errors: @ticket.errors.full_messages}, status: 503
    end
  end

  def update
    if @ticket.update(ticket_params)
      render json: @ticket
    else
      render json: { errors: @ticket.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    if ticket_sold?
      render json: { error: "Some tickets have been sold, ticket cannot be deleted." }, status: :unprocessable_entity
      return
    end

    @ticket.destroy
    head :no_content
  end


  private
  
  def ticket_sold?
    @ticket.remaining != @ticket.availability 
  end

  def find_ticket
    @ticket = Ticket.find(params[:id])
  end

  def find_organizers_event
    begin
      @event = @event_organizer.events.find(params[:event_id])
    rescue ActiveRecord::RecordNotFound
      render json: {errors: 'event not found'}, status: :not_found
    end
  end

  def find_organizers_ticket
    begin
      @ticket = Ticket.find(params[:id])
      if @event_organizer.id != @ticket.event.event_organizer.id
        render json: {errors: 'ticket not found'}, status: :not_found
      end
    rescue ActiveRecord::RecordNotFound
      render json: {errors: 'ticket not found'}, status: :not_found
    end
  end

  def ticket_params
    params.permit(:type, :price, :availability, :remaining)
  end

end
