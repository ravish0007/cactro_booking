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
          @organizer = EventOrganizer.find(@decoded[:id])
        elsif @role == 'USER'
          @user = User.find(@decoded[:id])
        end
      rescue JWT::DecodeError => e
        render json: {errors: e.message}, status: :unauthorized
      end
    end
end
