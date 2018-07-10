class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  add_flash_types :info, :success, :warning, :danger
  before_action :set_locale
  
  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
  
  def default_url_options
    { locale: I18n.locale }
  end
end
