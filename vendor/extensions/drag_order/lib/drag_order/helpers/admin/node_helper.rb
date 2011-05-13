module DragOrder
  module Helpers
    module Admin
      module NodeHelper
            
        def self.included(base)
          base.class_eval do
            
            def order_dragger
              %{<img src="/images/admin/extensions/drag_order/handle.png" alt ="Drag this icon to move the page" />}
            end
            
            def padding_left(level)
              (level * 23) + 31
            end

            def expander
              image((expanded ? "collapse" : "expand"),
                    :class => "expander #{needs_expanding ? 'visible' : 'hidden'}", :alt => 'toggle children',
                    :title => '')
            end
            
            def needs_expanding
              @current_node.children.present? and @current_node.parent.present?
            end
            
          end
        end
        
      end
    end
  end
end