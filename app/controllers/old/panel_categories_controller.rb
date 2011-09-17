class PanelCategoriesController < ApplicationController
  before_filter :login_required

  access_control do
    allow :admin
  end

  def index
    @panel_categories = PanelCategory.paginate(:all,:per_page=>20,:page => params[:page], :order => 'created_at DESC')
  end

  def new
    @panel_category = PanelCategory.new
  end

  def create
    @panel_category = PanelCategory.new(params[:panel_category])
    if @panel_category.save
      redirect_to "/panel_categories"
      flash[:notice] = "分类#{@panel_category.name}添加成功"
    else
      flash[:error]  = "添加失败，请重新尝试"
      render :action => 'new'
    end
  end

  def edit
    @panel_category = PanelCategory.find(params[:id])
  end

  def update
    @panel_category = PanelCategory.find(params[:id])
    if @panel_category.update_attributes(params[:panel_category])
      flash[:notice] = "#{@panel_category.name} 修改成功"
      redirect_to "/panel_categories"
    else
      flash[:error] = "#{@panel_category.name} 修改失败"
      render :action => "edit"
    end
  end

  def destroy
    @panel_category = PanelCategory.find(params[:id])
    if @panel_category.destroy
      flash[:notice] = "#{@panel_category.name} 删除成功"
    else
      flash[:error] = "发生未知错误，请联系管理员"
    end
    redirect_to "/panel_categories"
  end
end
