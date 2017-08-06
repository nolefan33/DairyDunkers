class CookiesController < ApplicationController
  def show
    @cookie = Cookie.find(params[:id])
  end

  def create
    if !admin_signed_in?
      head 401
    end
    cookie = Cookie.new(cookie_params)

    respond_to do |format|
      begin
        if cookie.save
          format.json { render json: { id: cookie.id, status: :created } }
        else
          format.json { render json: { error: cookie.errors, status: :unprocessable_entity } }
        end
      rescue Exception => e
        format.json { render json: { error: e, status: :unprocessable_entity } }
      end
    end
  end

  def delete
    if !admin_signed_in?
      head 401
    end
    cookie = Cookie.find(params[:id])

    if cookie == nil
      respond_to do |format|
        format.json { render json: { error: "No Cookie", status: :unprocessable_entity } }
      end
    end
    
    respond_to do |format|
      begin
        if cookie.destroy
          format.json { render json: { id: params[:id], status: :deleted } }
        else
          format.json { render json: { error: cookie.errors, status: :unprocessable_entity } }
        end
      rescue Exception => e
        format.json { render json: { error: e, status: :unprocessable_entity } }
      end
    end
  end

  def cookie_params
    params.permit(:title, :description, :photo)
  end
end
