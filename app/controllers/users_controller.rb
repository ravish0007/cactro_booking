class UsersController < ApplicationController
  skip_before_action :authenticate_user, only: [:create]
  before_action  :find_user, :verify_user_role, except: [:create]

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user.to_json(except: [:password_digest]), status: 201
    else
      render json: {errors: @user.errors.full_messages}, status: 503
    end
  end

  def show
    render json: @user.to_json(except: [:password_digest]), status: 200
  end


  private 

  def verify_user_role
    verify_role('USER')
  end

  def user_params
    params.permit(:name, :email, :password, :phone)
  end

  def find_user
    @user = User.find(params[:id])
  end
end
