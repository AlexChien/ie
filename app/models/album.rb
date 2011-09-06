class Album < ActiveRecord::Base
  has_many :assets,:as=>:resource, :dependent => :destroy
  
  validates_presence_of :title
  
  def primary_image_url
    asset = self.assets.is_primary.first
    asset.nil? ? "" : asset.photo.url(:thumb)
  end
end
