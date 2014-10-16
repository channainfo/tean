class SessionsController < ApplicationController
  skip_before_action :authenticate_user!, except: [:destroy]

  def new
    if user_signed_in?
      redirect_to after_signed_in_path, notice: "You already signed in"
    end
  end

  def create
    if user = User.authenticate(params[:email], params[:password])
      sign_in(user)

      respond_to do |format|
        format.html do
          redirect_to after_signed_in_path, notice: "Signed in successfully"
        end

        format.json { head :ok }
      end

    else
      respond_to do |format|
        format.html do
          flash.now[:alert] = "Invalid email/password"
          render :new
        end

        format.json do 
          errors = { success: false, error: "The email or password is incorrect." }
          render json: errors, status: 401
        end
      end
    end

  end

  def omniauth_fb_create
    if user = User.from_omniauth(request.env['omniauth.auth'])
      sign_in(user)

      respond_to do |format|
        format.html { redirect_to feed_path, notice: "You have been signed in with facebook successfully" }
        format.json { head :ok }
      end
    else
      error_message = "Your facebook has not registered to the app"

      respond_to do |format|
        format.html { redirect_to login_path, alert: error_message }

        format.json do
          errors = { success: false, error: error_message }
          render json: errors, status: 401
        end
      end
    end
  end

  def destroy
    sign_out
    redirect_to after_signed_out_path, notice: "You have been signed out"
  end
end
