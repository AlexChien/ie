class PanelContent < ActiveRecord::Base
  acts_as_tree
  belongs_to :panel_category

  validates_presence_of :title,:panel_category_id

  named_scope :published, :conditions => ["is_published=1"]

  named_scope :in_category_name, lambda { |category_name|
    { :include=> [:panel_category],:conditions => ["panel_categories.name = ?", category_name] }
  }

  named_scope :in_category_id, lambda {|category_id|
    { :include=> [:panel_category],:conditions => ["panel_categories.id in (?)", category_id] }
  }

  has_attached_file :uploaded_data,
                    :default_url => "",
                    :url => "/images/assets/:attachment/:id/:style/:filename",
                    :path => ":rails_root/public/images/assets/:attachment/:id/:style/:filename"
  # validates_attachment_presence :uploaded_data,:message => "请选择上传文件"
  validates_attachment_content_type :uploaded_data,
    :content_type => ['image/jpg', 'image/jpeg', 'image/pjpeg', 'image/gif', 'image/png', 'image/x-png'],
    :message => "上传格式不符"
  validates_attachment_size :uploaded_data,
    :less_than => 5.megabyte, #another option is :greater_than
    :message => "上传文件小于5M"

  after_post_process :find_dimensions

  def find_dimensions
    temporary = uploaded_data.queued_for_write[:original]
    filename = temporary.path unless temporary.nil?
    filename = uploaded_data.path if filename.blank?
    geometry = Paperclip::Geometry.from_file(filename)
    self.uploaded_data_width  = geometry.width
    self.uploaded_data_height = geometry.height
  end

  def show_status
    if self.is_published
      "<img src='/images/published.gif' />"
    else
      "<img src='/images/draft.gif' />"
    end
  end

  def self.list_contents(category,limit=nil)
    self.in_category_name(category).published.all(:order=>"panel_contents.weight DESC,panel_contents.created_at DESC",:limit=>limit)
  end

  def target
    if self.target_type == 1
      " target='_blank' "
    else
      " class='thickbox' "
    end
  end

end
