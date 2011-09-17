class AdminController < ApplicationController  
  
  layout 'admin'

  before_filter :authenticate_user!  

  def index
    
  end

  def setting
    
  end

end