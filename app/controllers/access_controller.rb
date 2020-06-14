class AccessController < ApplicationController
  
  include CurrentCart
  before_action :set_cart
  
  skip_before_action :authorize
  
  def new
    puts params[:name]
    if session[:user_id]
        redirect_to admin_url, notice: "already logged on"
    elsif params[:name]
        create
    end
  end

  def create
    user = User.find_by(name: params[:name])
    puts user.password_digest
    if user and user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to admin_url
    else
        redirect_to login_url, notice: "Invalid user/password combination"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_url, notice: "Logged out"
  end
end
