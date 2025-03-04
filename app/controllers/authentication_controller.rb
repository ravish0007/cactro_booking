class AuthenticationController < ApplicationController
  skip_before_action :authenticate_user


  def user_login
    @user = User.find_by_email(params[:email])
    issue_token(@user, 'USER')
  end


  def organizer_login
    @event_organizer = EventOrganizer.find_by_email(params[:email])
    issue_token(@event_organizer, 'ORGANIZER')
  end


  def issue_token(account, role)
    if account&.authenticate(params[:password])
      token = JwtToken.encode({id: account.id, role: role})
      render json: {token: token}, status: :ok
    else
      render json: {error: 'unauthorized'}, stauts: :unauthorized
    end
  end


end
