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
    
    admin = Admin.new({email: params[:email], password: params[:password]})

    respond_to do |format|
      begin
        if admin.save
          format.json { render json: { status: :created } }
        else
          format.json { render json: { error: admin.errors, status: :unprocessable_entity } }
        end
      rescue Exception => e
        format.json { render json: { error: e, status: :unprocessable_entity } }
      end
    end
  end
end
