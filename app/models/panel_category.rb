class PanelCategory < ActiveRecord::Base
  acts_as_tree :order => "weight desc"
  has_many :panel_contents

  validates_presence_of :name

  named_scope :root, :conditions => {:parent_id => nil}

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
