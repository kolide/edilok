class SessionsController < ApplicationController
  skip_before_action :ensure_authenticated_user

  # GET /signin
  def new
    #...
  end

  # POST /signin
  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      signin_user_and_redirect!(user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  # DELETE /signout
  def destroy
    reset_session
    redirect_to signin_path
  end
end
