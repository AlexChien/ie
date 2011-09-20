class Upload < ActiveRecord::Base
  belongs_to :resource, :polymorphic => true
  validates_presence_of :name
  
  has_attached_file :uploaded_data,
                    :url => "/assets/:attachment/:id/:style/:filename",
                    :path => ":rails_root/public/assets/:attachment/:id/:style/:filename",
                    :styles => lambda{|data|
                      data.instance.is_image? ? {:thumb=>'72x48>'} : {}
                    }
  validates_attachment_presence :uploaded_data,:message => "请选择上传文件"
  
  # validates_attachment_size :uploaded_data,
  #                           :less_than => 10.megabyte,
  #                           :message => "上传文件小于10M"
  
  scope :in_file_type, lambda {|file_type|
    {:conditions => ["uploads.file_type in (?)", file_type] }
  }
  
  # file_type [["图片",0], ["flv",1],["其它",99]]
  
  # handling delete in your model, if needed. Replace all image occurences with your asset name.
  attr_accessor :delete_uploaded_data
  before_save { self.uploaded_data = nil if self.delete_uploaded_data == '1' }
  
  def is_image?
    ['image/jpg',
     'image/jpeg',
     'image/pjpeg',
     'image/gif',
     'image/png',
     'image/x-png'].include?(self.uploaded_data_content_type)
  end
end
