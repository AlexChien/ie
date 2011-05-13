module DragOrder
  module Controllers
    module Admin
      module PagesController
            
        def self.included(base)
          base.class_eval do
            
            before_filter :drag_assets, :only => [:index, :remove]
            
            def sort
              begin
                parent = Page.find(params[:parent_id])
                params[:children].split(',').each_with_index do |child,index|
                  Page.find(child).update_attributes!(
                    :position  => index,
                    :parent_id => params[:parent_id]
                  )
                end
                
                respond_to do |format|
                  format.js { render :text => 'Pages successfully sorted.' }
                end
              rescue Exception => e # Without this resource controller will exception when it looks for Page.find('sort.js')
                respond_to do |format|
                  format.js { render :text => 'Could not sort Pages.', :status => :unprocessable_entity }
                end
              end
            end
            
            private
            
            def drag_assets
              @javascripts << 'admin/dragdrop.js'
              @javascripts << 'admin/sortable_tree.js'
              @javascripts << 'admin/extensions/drag_order/drag_order.js'
              @stylesheets << 'admin/extensions/drag_order/drag_order.css'
            end
            
          end
        end
        
      end
    end
  end
end