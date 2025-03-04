class EventOrganizersController < ApplicationController
  skip_before_action :authenticate_user, only: [:create]
  before_action :find_organizer, :verify_role  except: [:create]

  def create
    @event_organizer = EventOrganizer.new(event_organizer_params)
    if @event_organizer.save
      render json: @event_organizer.to_json(except: [:password_digest]), status: 201
    else
      render json: {errors: @event_organizer.errors.full_messages}, status: 503
    end
  end

  def show
    render json: @event_organizer.to_json(except: [:password_digest]), status: 200
  end


  private 

  def verify_role
    @role == 'ORGANIZER'
  end


  def event_organizer_params
    params.permit(:name, :email, :password, :phone)
  end

  def find_organizer
    @event_organizer = EventOrganizer.find(params[:id])
  end
end










