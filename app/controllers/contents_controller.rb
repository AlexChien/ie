class ContentsController < ApplicationController
  def show
    @content = Content.find(params[:id])
    if @content.link_type == 2
      template = @content.page.template
      render :inline => template.layout
    else
      redirect_to "/"
    end
  end
end
