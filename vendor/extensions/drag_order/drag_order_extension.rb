class DragOrderExtension < Radiant::Extension
  version YAML::load_file(File.join(File.dirname(__FILE__), 'VERSION'))
  description "Radiant DragOrder allows you to reorder pages funly"
  url "https://github.com/dirkkelly/radiant-drag-order"
  
  def activate    
    Page.send :include, DragOrder::Models::Page
    StandardTags.send :include, DragOrder::Tags::Core
    Admin::PagesController.send :include, DragOrder::Controllers::Admin::PagesController
    Admin::NodeHelper.send :include, DragOrder::Helpers::Admin::NodeHelper
    
    admin.pages.index.add :node,  "handle", :before => "title_column"
  end
  
end