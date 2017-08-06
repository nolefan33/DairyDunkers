class HomeController < ApplicationController
  def index
    @cookies = Cookie.all
  end

  def signup
    signup = SignUp.new({email: params[:email]})

    respond_to do |format|
      begin
        if signup.save
          format.json { render json: { status: :created } }
        else
          format.json { render json: { error: signup.errors, status: :unprocessable_entity } }
        end
      rescue ActiveRecord::RecordNotUnique => e
        format.json { render json: { error: "Existing Record", status: :unprocessable_entity } }
      rescue Exception => e
        format.json { render json: { error: e, status: :unprocessable_entity } }
      end
    end
  end
end
