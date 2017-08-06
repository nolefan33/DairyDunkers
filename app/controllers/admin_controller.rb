class AdminController < ApplicationController
  
  def landing
    if !admin_signed_in?
      redirect_to :new_admin_session
    end

    @cookies = Cookie.all
    @signups = SignUp.all
  end

  def create
    if !admin_signed_in?
      head 401
    end
    
    Admin.create({email: params[:email], password: params[:password]})
  end
end
