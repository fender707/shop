require 'open-uri'
require 'json'
require 'psych'
require 'net/http'

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!, :set_locale
  helper_method :categories, :messages, :weather

  def weather
    uri = URI("http://api.openweathermap.org/data/2.5/weather?q=khmelnitsky")
    request = Net::HTTP.get(uri)
    response = JSON.parse(request)
    result = "t=" + (response["main"]["temp"] - 273).to_s.split('.')[0] + 
             "deg. | " + response["weather"][0]["description"].to_s + 
             " | wind speed " + response["wind"]["speed"].to_s
    #(response["main"]["temp"] - 273).to_i
  end

  private

  def set_locale
    if params[:locale]
      if I18n.available_locales.map(&:to_s).include?(params[:locale])
        I18n.locale = params[:locale]
      else
        I18n.locale = I18n.default_locale 
      end
    end
  end

  def default_url_options
    { locale: I18n.locale }
  end

  def messages
    @messages ||= Message.all
  end

  def categories
    @categories = Category.all
  end
  
  def current_cart
    cart = Cart.where(id: session[:cart_id]).first_or_create
    session[:cart_id] = cart.id
    cart
  end
end
