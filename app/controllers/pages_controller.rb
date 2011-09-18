class PagesController < ApplicationController
  def show
    page = Page.find_by_path("/#{params[:path]}")
    if page
      subpage = page.find_last_subpage
      template = subpage.template
      render :inline => template.layout
    else
      redirect_to "/"
    end
  end
end
