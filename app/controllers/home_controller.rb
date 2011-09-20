class HomeController < ApplicationController
  def index
    page = Page.find_by_path("/")
    if page
      template = page.template
      render :inline => template.layout
    end
  end
end
