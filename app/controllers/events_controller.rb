class EventsController < ApplicationController
  before_action :verify_organizer_role, except: [:index, :show]
  before_action :find_event, only: [:show]
  before_action :find_organizers_event, only: [:update, :destroy]

  def index
    @events  = Event.all
    render json: @events
  end 

  def show
    render json: @event
  end

  def create
    @event = @event_organizer.events.build(event_params)
    if @event.save
      render json: @event, status: :created
    else
      render json: {errors: @event.errors.full_messages}, status: 503
    end
  end

  def update
    if @event.update(event_params)
      EmailEventUpdateJob.perform_later(@event)
      render json: @event
    else
      render json: { errors: @event.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    if tickets_sold?
      render json: { error: "Some tickets have been sold, so the event cannot be deleted." }, status: :unprocessable_entity
      return
    end

    @event.destroy
    head :no_content

  end


  private

  def tickets_sold?
    @event.tickets.any? { |ticket| ticket.remaining != ticket.availability }
  end

  def find_event
    @event = Event.find(params[:id])
  end

  def find_organizers_event
    begin
      @event = @event_organizer.events.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: {errors: 'event not found'}, status: :not_found
    end
  end

  def event_params
    params.permit(:name, :description, :venue, :date)
  end

end
