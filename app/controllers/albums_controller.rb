class AlbumsController < ApplicationController
  before_filter :login_required,:except=>[:index,:show]

  access_control do
    allow :admin
    action :index,:show do
      allow all
    end
  end
  
  def index
    @albums = Album.paginate(:all, :per_page => 12, :page => params[:page], :order  => 'albums.weight DESC,albums.created_at DESC')
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(params[:album])
    if @album.save
      flash[:notice] = "#{@album.title}添加成功"
      redirect_to "/albums"
    else
      flash[:error]  = "添加失败，请重新尝试"
      render :action => 'new'
    end
  end

  def edit
    @album = Album.find(params[:id])
    @assets = @album.assets.paginate(:all, :per_page => 12, :page => params[:page], :order  => 'assets.weight DESC,created_at DESC')
  end
  
  def show
    @album = Album.find(params[:id])
    @assets = @album.assets.paginate(:all, :per_page => 12, :page => params[:page], :order  => 'assets.weight DESC,created_at DESC')
  end

  def update
    @album = Album.find(params[:id])
    if @album.update_attributes(params[:album])
      flash[:notice] = "#{@album.title} 修改成功"
      redirect_to "/albums"
    else
      flash[:error] = "#{@album.title} 修改失败"
      render :action => "edit"
    end
  end

  def destroy
    @album = Album.find(params[:id])
    if @album.destroy
      flash[:notice] = "#{@album.title} 删除成功"
    else
      flash[:error] = "发生未知错误，请联系管理员"
    end
    redirect_to "/albums"
  end
  
  def assets_new
    @album = Album.find(params[:id])
  end
  
  def assets_create
    @album = Album.find(params[:id])
    start_size = @album.assets.count
    for i in 1..params[:asset_count].to_i do
      unless params["photo_" + i.to_s].nil?
        asset = Asset.new(params["photo_" + i.to_s])
        asset.name = params["photo_" + i.to_s + "_name"]
        asset.weight = params["photo_" + i.to_s + "_weight"]
        asset.memo = params["photo_" + i.to_s + "_memo"]
        asset.resource = @album
        asset.photo_type = 1 if start_size == 0
        asset.save
      end
    end
    end_size = @album.assets.count
    flash[:notice] = "相册#{@album.title}成功上传#{end_size-start_size}张图片"
    redirect_to "/albums"
  end
  
  def assets_batch
    @album = Album.find(params[:id])
    if params[:batch_type] == "1"
      start_size = @album.assets.count
      if params[:check_ids]
        transfer_album = Album.find(params[:album])
        for id in params[:check_ids]
          asset = Asset.find(id)
          asset.resource = transfer_album
          asset.photo_type = 0
          asset.save
        end
      end
      end_size = @album.assets.count
      flash[:notice] = "批量转移成功，共计#{start_size-end_size}张图片"
    elsif params[:batch_type] == "2"
      start_size = @album.assets.count
      if params[:check_ids]
        for id in params[:check_ids]
          asset = Asset.find(id)
          asset.destroy
        end
      end
      end_size = @album.assets.count
      flash[:notice] = "批量删除成功，共计#{start_size-end_size}张图片"
    end
    redirect_to "/albums/#{@album.id}/edit"
  end
  
end
