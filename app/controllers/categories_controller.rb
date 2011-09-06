class CategoriesController < ApplicationController
  before_filter :login_required,:except => [:show]

  access_control do
    allow :admin
    action :show do
      allow all
    end
  end

  def index
    @categories = Category.paginate(:all,:per_page=>20,:page => params[:page], :order => 'created_at DESC')
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(params[:category])
    if @category.save
      redirect_to "/categories"
      flash[:notice] = "分类#{@category.name}添加成功"
    else
      flash[:error]  = "添加失败，请重新尝试"
      render :action => 'new'
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def show
    @category = Category.find(params[:id])
    @articles = @category.articles.published.paginate(:all,:per_page=>5,:page => params[:page],:order=>"issue_time DESC")
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(params[:category])
      flash[:notice] = "#{@category.name} 修改成功"
      redirect_to "/categories"
    else
      flash[:error] = "#{@category.name} 修改失败"
      render :action => "edit"
    end
  end

  def destroy
    @category = Category.find(params[:id])
    if @category.destroy
      flash[:notice] = "#{@category.name} 删除成功"
    else
      flash[:error] = "发生未知错误，请联系管理员"
    end
    redirect_to "/categories"
  end

end
