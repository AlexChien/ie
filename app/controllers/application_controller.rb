# encoding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery

  # include AuthenticatedSystem

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to "/", :alert => exception.message
  end

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  before_filter :set_locale

  def set_locale
    session[:locale] = params[:locale] if params[:locale]
    I18n.locale = session[:locale] || I18n.default_locale
  end

end
