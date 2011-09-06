# encoding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery

  # include AuthenticatedSystem

  rescue_from 'Acl9::AccessDenied', :with => :access_denied

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

protected
  def access_denied
    flash[:error] = '你没有登陆或者没有权限执行此操作。'
    redirect_to login_path
  end
  
end
