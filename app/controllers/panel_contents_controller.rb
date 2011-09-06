class PanelContentsController < ApplicationController
  before_filter :login_required

  access_control do
    allow :admin
  end

  def index
    panel_content = PanelContent
    unless params[:pcid].blank?
      pc = PanelCategory.find(params[:pcid])
      # don't show all subcategories for tease category, might be migrated
      # into db model later
      if params[:pcid] == PanelCategory.find_by_name("最新鉴赏").id.to_s
        panel_content = panel_content.in_category_id(pc.id)
      else
        panel_category_ids = pc.find_all_subcategory_ids
        panel_content = panel_content.in_category_id(panel_category_ids)
      end
    end
    @panel_contents = panel_content.paginate(:all,
                          :per_page   => 20,
                          :page       => params[:page],
                          :order      => 'panel_contents.is_published DESC,panel_contents.weight DESC,
                                          panel_contents.created_at DESC')
  end

  def new
    @panel_content = PanelContent.new
  end

  def create
    @panel_content = PanelContent.new(params[:panel_content])
    if @panel_content.save
      flash[:notice] = "#{@panel_content.title}添加成功"
      if @panel_content.panel_category.rq_image
        redirect_to "/panel_contents/#{@panel_content.id}/edit"
      else
        redirect_to "/panel_contents?pcid=#{@panel_content.panel_category.id}"
      end
    else
      flash[:error]  = "添加失败，请重新尝试"
      render :action => 'new'
    end
  end

  def edit
    @panel_content = PanelContent.find(params[:id])
  end

  def update
    @panel_content = PanelContent.find(params[:id])
    if @panel_content.update_attributes(params[:panel_content])
      flash[:notice] = "#{@panel_content.title} 修改成功"
      redirect_to "/panel_contents?pcid=#{@panel_content.panel_category.id}"
    else
      flash[:error] = "#{@panel_content.title} 修改失败"
      render :action => "edit"
    end
  end

  def destroy
    @panel_content = PanelContent.find(params[:id])
    if @panel_content.destroy
      flash[:notice] = "#{@panel_content.title} 删除成功"
    else
      flash[:error] = "发生未知错误，请联系管理员"
    end
    redirect_to "/panel_contents?pcid=#{@panel_content.panel_category.id}"
  end

  def croper
    @panel_content = PanelContent.find(params[:id])
    @panel_category = @panel_content.panel_category
    @preview_width = 200
    @preview_height = @panel_category.height * @preview_width / @panel_category.width
    render :layout => false
  end

  def crop
    @panel_content = PanelContent.find(params[:id])
    x1 = params[:x1].to_i
    y1 = params[:y1].to_i
    x2 = params[:x2].to_i
    y2 = params[:y2].to_i
    w = params[:w].to_i
    h = params[:h].to_i
    to_w = @panel_content.panel_category.width
    to_h = @panel_content.panel_category.height
    if w != 0 && h !=0
      url = "#{@panel_content.uploaded_data.path}"
      to_url = "#{@panel_content.uploaded_data.path}"
      Paperclip.run("convert","-crop #{w}x#{h}+#{x1}+#{y1} #{url} -resize #{to_w}x#{to_h} #{to_url}")
      filesize = File.size(to_url)
      @panel_content.update_attributes(:uploaded_data_file_size=>filesize,
                                       :uploaded_data_width=>to_w,
                                       :uploaded_data_height=>to_h)
      flash[:notice] = "图片裁剪成功"
      redirect_to "/panel_contents/#{@panel_content.id}/edit"
    else
      redirect_to "/panel_contents/#{@panel_content.id}/croper"
    end
  end

end
