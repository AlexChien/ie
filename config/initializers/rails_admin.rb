#         ooooooooo.              o8o  oooo                 .o.             .o8                     o8o              
#         `888   `Y88.            `"'  `888                .888.           "888                     `"'              
#          888   .d88'  .oooo.   oooo   888   .oooo.o     .8"888.      .oooo888  ooo. .oo.  .oo.   oooo  ooo. .oo.   
#          888ooo88P'  `P  )88b  `888   888  d88(  "8    .8' `888.    d88' `888  `888P"Y88bP"Y88b  `888  `888P"Y88b  
#          888`88b.     .oP"888   888   888  `"Y88b.    .88ooo8888.   888   888   888   888   888   888   888   888  
#          888  `88b.  d8(  888   888   888  o.  )88b  .8'     `888.  888   888   888   888   888   888   888   888  
#         o888o  o888o `Y888""8o o888o o888o 8""888P' o88o     o8888o `Y8bod88P" o888o o888o o888o o888o o888o o888o 

# RailsAdmin config file. Generated on September 12, 2011 01:08
# See github.com/sferik/rails_admin for more informations

RailsAdmin.config do |config|

  config.authorize_with :cancan

  config.included_models = ["Story","User","Template","Page","Content","Upload","Department","Job","Role"]
  
  config.model Story do
    weight -50
    exclude_fields :id
    field :pubdate, :date do
      strftime_format "%Y-%m-%d"
    end
    list do
      sort_by :pubdate
      field :title_en do
        pretty_value do
          bindings[:object].title_en.to_s.truncate_words(15)
        end
      end
      field :title_zh_cn do
        pretty_value do
          bindings[:object].title_zh_cn.to_s.truncate_words(15)
        end
      end
    end
  end
  
  config.model Page do
    weight -40
    field :name_en
    field :name_zh_cn
    field :path
    field :template
    field :parent
    field :children
    field :html_content, :text do
      ckeditor true
    end
    field :html_content_en, :text do
      ckeditor true
    end
    field :use_portlet
    field :portlet_content
    field :contents
    include_fields :created_at, :updated_at
    list do
      exclude_fields :html_content,:html_content_en,:use_portlet,:portlet_content,:contents
    end
    edit do
      field :contents do
        orderable true
      end
      
      field :children do
        orderable true
      end

    end
  end
  
  config.model Content do
    field :title
    field :title_en
    field :page
    field :issue_date, :date do
      strftime_format "%Y-%m-%d"
    end 
    field :link_type, :enum do
      enum do
        [["无链接",0], ["自行填写",1],["自动生成",2]]
      end
    end
    include_fields :source, :source_en
    field :source_link
    field :uploads
    field :desc, :text do
      ckeditor true
    end
    field :desc_en, :text do
      ckeditor true
    end
    include_fields :created_at, :updated_at
    list do
      field :title do
        pretty_value do
          bindings[:object].title.to_s.truncate_words(15)
        end
      end
      field :title_en do
        pretty_value do
          bindings[:object].title_en.to_s.truncate_words(15)
        end
      end
      field :source_link do
        pretty_value do
          bindings[:object].source_link.to_s.truncate_words(15)
        end
      end
      exclude_fields :uploads,:desc,:desc_en
    end
  end
  
  config.model Upload do
    field :name
    field :file_type, :enum do
      enum do
        [["图片",0], ["flv",1],["其它",99]]
      end
    end
    field :uploaded_data, :paperclip_file do
      thumb_method :thumb # for images. Will default to full size image, which might break the layout
      delete_method :delete_uploaded_data # actually not needed in this case: default is "delete_#{field_name}" if the object responds to it
    end
    field :resource
    include_fields :created_at, :updated_at
    list do
      exclude_fields :uploaded_data
    end
  end
  
  config.model Job do
    weight 30
    
    field :job_name
    field :job_name_en
    field :department
    field :job_type, :enum do
      enum do
        [["社会招聘",0], ["校园招聘",1],["实习生计划",99]]
      end
    end
    field :responsibility, :text do
      ckeditor true
    end
    field :requirement, :text do
      ckeditor true
    end
    include_fields :created_at, :updated_at
    list do
      exclude_fields :responsibility,:requirement
    end
  end
  
  config.model Department do
    weight 40
    parent Job
  end
  
  config.model User do
    weight 50
    field :roles, :has_and_belongs_to_many_association
    
    list do
      include_fields :email, :roles, :sign_in_count, :current_sign_in_at, :last_sign_in_at, :current_sign_in_ip,
                     :last_sign_in_ip, :failed_attempts, :roles, :created_at, :updated_at
    end
    edit do
      include_fields :email, :password, :password_confirmation, :roles
    end
    export do
      include_fields :email, :sign_in_count, :current_sign_in_at, :last_sign_in_at, :current_sign_in_ip,
                     :last_sign_in_ip, :failed_attempts, :roles, :created_at, :updated_at
    end
  end
  
  config.model Role do
    weight 55
    parent User
  end
  
  config.model Template do
    weight 60
    
    list do
      exclude_fields :id,:layout
    end
  end
  #  ==> Authentication (before_filter)
  # This is run inside the controller instance so you can setup any authentication you need to.
  # By default, the authentication will run via warden if available.
  # and will run on the default user scope.
  # If you use devise, this will authenticate the same as authenticate_user!
  # Example Devise admin
  # RailsAdmin.config do |config|
  #   config.authenticate_with do
  #     authenticate_admin!
  #   end
  # end
  # Example Custom Warden
  # RailsAdmin.config do |config|
  #   config.authenticate_with do
  #     warden.authenticate! :scope => :paranoid
  #   end
  # end
  
  #  ==> Authorization
  # Use cancan https://github.com/ryanb/cancan for authorization:
  # config.authorize_with :cancan
  
  # Or use a custom dead-stupid authorization rule:
  # config.authorize_with do
  #   redirect_to root_path unless warden.user.is_admin?
  # end
  
  # Use a specific role for ActiveModel's :attr_acessible :attr_protected
  # Default is :default
  # current_user is accessible in the block if you want to make it user specific.
  # config.attr_accessible_role { :default }
  
  #  ==> Dev. settings
  # Reload rails_admin with each request (can be slow) in development mode
  config.reload_between_requests = true if Rails.env.development?
  
  #  ==> Global show view settings
  # Display empty fields in show views
  # config.compact_show_view = false
  
  #  ==> Global list view settings
  # Number of default rows per-page:
  # config.default_items_per_page = 50
  
  #  ==> Included models
  # Add all excluded models here:
  # config.excluded_models << []
  
  # Add models here if you want to go 'whitelist mode':
  # config.included_models << []
  
  # Application wide tried label methods for models' instances
  # config.label_methods << [:description] # Default is [:name, :title]
  
  #  ==> Global models configuration
  # config.models do
  #   # Configuration here will affect all included models in all scopes, handle with care!
  #   
  #   list do
  #     # Configuration here will affect all included models in list sections (same for show, export, edit, update, create)
  #     
  #     fields :name, :other_name do
  #       # Configuration here will affect all fields named [:name, :other_name], in the list section, for all included models
  #     end
  #     
  #     fields_of_type :date do
  #       # Configuration here will affect all date fields, in the list section, for all included models. See README for a comprehensive type list.
  #     end
  #   end
  # end
  #
  #  ==> Model specific configuration
  # Keep in mind that *all* configuration blocks are optional. 
  # RailsAdmin will try his best to provide the best defaults for each section, for each field! 
  # Try to override as few things as possible, in the most generic way. Try to avoid setting labels for models and attributes, use ActiveRecord I18n API instead. 
  # Less code is better code!
  # config.model MyModel do
  #   # Here goes your cross-section field configuration for ModelName.
  #   object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #   label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #   label_plural 'My models'      # Same, plural
  #   weight -1                     # Navigation priority. Bigger is higher.
  #   parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #   navigation_label              # Sets dropdown entry's name in navigation. Only for parents!
  #   # Section specific configuration:
  #   list do
  #     filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #     items_per_page 100    # Override default_items_per_page
  #     sort_by :id           # Sort column (default is primary key)
  #     sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     # Here goes the fields configuration for the list view
  #   end
  #   show do
  #     # Here goes the fields configuration for the show view
  #   end
  #   export do
  #     # Here goes the fields configuration for the export view (CSV, yaml, XML)
  #   end
  #   edit do
  #     # Here goes the fields configuration for the edit view (for create and update view)
  #   end
  #   create do
  #     # Here goes the fields configuration for the create view, overriding edit section settings
  #   end
  #   update do
  #     # Here goes the fields configuration for the update view, overriding edit section settings
  #   end
  # end
  
# fields configuration is described in the Readme, if you have other question, ask us on the mailing-list! 

#  ==> Your models configuration, to help you get started!

end

# You made it this far? You're looking for something that doesn't exist! Add it to RailsAdmin and send us a Pull Request!