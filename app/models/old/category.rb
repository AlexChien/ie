class Category < ActiveRecord::Base
  acts_as_tree :order => "name"
  has_many :articles

  validates_presence_of :name

  named_scope :no_parent, :conditions => {:parent_id => nil}

  def find_all_subcategory_ids(ids=[])
    if self.children.size > 0
      self.children.each do |subcat|
        if subcat.children.size > 0
          subcat.find_all_subcategory_ids(ids)
        else
          ids << subcat.id
        end
      end
    end
    ids << self.id
  end
end
