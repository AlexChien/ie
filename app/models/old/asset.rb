class Asset < ActiveRecord::Base
  belongs_to :resource, :polymorphic => true
  named_scope :is_primary, :conditions => ["photo_type=1"]

  has_attached_file :photo,
                    :styles => {:thumb => '100x100>'},
                    :url => "/images/assets/:attachment/:id/:style/:filename",
                    :path => ":rails_root/public/images/assets/:attachment/:id/:style/:filename"
  validates_attachment_presence :photo,:message => "请选择上传文件"
  validates_attachment_content_type :photo,
     :content_type => ['image/jpg', 'image/jpeg', 'image/pjpeg', 'image/gif', 'image/png', 'image/x-png'],
     :message => "上传格式不符"
  validates_attachment_size :photo,
                            :less_than => 10.megabyte,
                            :message => "上传文件小于10M"

  def show_photo_type
    if self.photo_type == 1
      "是"
    else
      "否"
    end
  end

end
