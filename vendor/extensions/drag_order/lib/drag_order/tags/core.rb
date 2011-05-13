module DragOrder
  module Tags
    module Core
      
      def self.included(base)
        base.class_eval do
          def children_find_options_with_drag_order(tag)
            options = children_find_options_without_drag_order(tag)
            options[:order].sub!(/published_at/i, 'position') unless tag.attr['by']
            options
          end
          alias_method_chain :children_find_options, :drag_order
        end
      end
      
    end
  end
end