class CookiesController < ApplicationController
  def show
    @cookie = Cookie.find(params[:id])
  end

  def create
    Cookie.create(cookie_params)
  end

  def cookie_params
    params.permit(:title, :description, :photo)
  end
end
