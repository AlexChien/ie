class WebserviceController < ApplicationController
  def teaser_album
    if params[:id]
      @latest_issue = PanelContent.find(params[:id])
    else
      @latest_issue = PanelContent.published.in_category_id(PanelCategory.find_by_name('最新鉴赏').id).first(:order => "panel_contents.id desc")
    end
    
    @pics = @latest_issue.blank? ? [] : @latest_issue.children.published
    respond_to do |format|
      format.xml {  }
    end
  end
end
