# encoding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery

  # before_filter :if => Proc.new{ |c| c.request.path =~ /admin/ } do
  #   @head_javascript_paths = ['app']
  #   @head_stylesheet_paths = ['app']
  # end


  # include AuthenticatedSystem

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  before_filter :set_locale

  def set_locale
    session[:locale] = params[:locale] if params[:locale]
    I18n.locale = session[:locale] || I18n.default_locale
  end

end
