class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user.authenticate(params[:password])
      session[:user_id] = @user.id
      if @user.role == "admin"
        redirect_to admin_dashboard_index_path(@user)
      else
        redirect_to user_path(@user)
      end
    else
      flash.now[:error] = "Username or Password invalid. Plz try again, fam."
      render :new
    end
  end

  def destroy
    session.clear
    flash[:success] = "You've successfully logged out!"
    redirect_to root_path
  end
end
