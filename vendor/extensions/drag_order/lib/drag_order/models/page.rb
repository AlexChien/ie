module DragOrder
  module Models
    module Page
      
      if defined?(Page::NONDRAFT_FIELDS)
        Page::NONDRAFT_FIELDS << 'position'
      end
      
      def self.included(base)
        base.class_eval do
          
          before_validation_on_create :set_initial_position
          
          self.reflections[:children].options[:order] = "position ASC"
          
        private
          def set_initial_position
            self.position ||= begin
              if last_sibling = Page.find_by_parent_id(parent_id, :order => [ "position DESC" ])
                last_sibling.position + 1
              else
                0
              end
            end
          end
          
        end
      end
      
    end
  end
end
