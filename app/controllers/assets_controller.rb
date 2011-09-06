class AssetsController < ApplicationController
  before_filter :login_required

  access_control do
    allow :admin
  end
  
  def edit
    @asset = Asset.find(params[:id])
  end
  
  def update
    @asset = Asset.find(params[:id])
    if @asset.update_attributes(params[:asset])
      flash[:notice] = "#{@asset.name} 修改成功"
      redirect_to "/albums/#{@asset.resource.id}/edit"
    else
      flash[:error] = "#{@asset.name} 修改失败"
      render :action => "edit"
    end
  end
  
  def to_primary
    @asset = Asset.find(params[:id])
    primary = @asset.resource.assets.is_primary.first
    primary.update_attribute(:photo_type,0) if primary
    @asset.update_attribute(:photo_type,1)
    flash[:notice] = "#{@asset.name} 成功设为封面图片"
    redirect_to "/albums/#{@asset.resource.id}/edit"
  end
  
  def destroy
    @asset = Asset.find(params[:id])
    if @asset.destroy
      flash[:notice] = "#{@asset.name} 删除成功"
    else
      flash[:error] = "发生未知错误，请联系管理员"
    end
    redirect_to "/albums/#{@asset.resource.id}/edit"
  end
end
