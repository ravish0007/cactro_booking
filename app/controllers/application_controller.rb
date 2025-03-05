class ApplicationController < ActionController::API

  include JwtToken

  before_action :authenticate_user

  private

    def authenticate_user
      header = request.headers['Authorization']
      token = header.split(' ').last if header
      begin
        @decoded = JwtToken.decode(token)
        @role = @decoded[:role]
        if @role == 'ORGANIZER'
          @event_organizer = EventOrganizer.find(@decoded[:id])
        elsif @role == 'USER'
          @user = User.find(@decoded[:id])
        end
      rescue JWT::DecodeError => e
        render json: {errors: e.message}, status: :unauthorized
      end
    end

    def verify_role(role)
      if @role != role
        render json: {errors: "role restricted"}, status: :unauthorized
      end
    end

    def verify_user_role
      verify_role('USER')
    end

    def verify_organizer_role
      verify_role('ORGANIZER')
    end
end
