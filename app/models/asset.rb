class Asset < ActiveRecord::Base
  belongs_to :resource, :polymorphic => true
  
  has_attached_file :uploaded_data,
                    :url => "/assets/:attachment/:id/:style/:filename",
                    :path => ":rails_root/public/assets/:attachment/:id/:style/:filename",
                    :styles => lambda{|data|
                      data.instance.is_image? ? {:thumb=>'72x48>'} : {}
                    }
  validates_attachment_presence :uploaded_data,:message => "请选择上传文件"
  validates_attachment_size :uploaded_data,
                            :less_than => 10.megabyte,
                            :message => "上传文件小于10M"
  
  def is_image?
    ['image/jpg',
     'image/jpeg',
     'image/pjpeg',
     'image/gif',
     'image/png',
     'image/x-png'].include?(self.uploaded_data_content_type)
  end
end
