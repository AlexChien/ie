class ContentsController < ApplicationController
  def show
    @content = Content.find(params[:id])
    template = @content.page.template
    render :inline => template.layout
  end
end
