module ApplicationHelper
  def flash_message
    messages = ""
    [:notice, :info, :warning, :error].each do|type|
      if flash[type]
        messages= "<div id=\"#{type}\">#{flash[type]}</div>"
      end
    end
    messages
  end

  def find_all_subcategories(category,text_indent=20)
    if category.class == PanelCategory
      href="/panel_contents?pcid="
    else
      href="/articles?cid="
    end
    ret = ""
    text_indent += 15
    if category.children.size > 0
      category.children.each { |subcat|
        if subcat.children.size > 0
          ret += "<a href='#{href}#{subcat.id}' style='text-indent:#{text_indent}px'><b>#{subcat.name}</b></a>"
          ret += find_all_subcategories(subcat,text_indent)
        else
          ret += "<a href='#{href}#{subcat.id}' style='text-indent:#{text_indent}px'><b>#{subcat.name}</b></a>"
        end
      }
    end
    ret
  end
  
  def find_all_subpages(page)
    ret = ""
    if page.children.size > 0
      ret += "<ul>"
      page.children.each do |subcat|
        subcat_name = subcat.show_columns('name')
        if subcat.children.size > 0
          ret += "<li><a class='hide' href='#{subcat.path}'>#{subcat_name}</a>"
          ret += "
                <!--[if lte IE 6]>
      		      <a class='sub' href='#{subcat.path}'>#{subcat_name}
      		      <table><tr><td>
      		      <![endif]-->
      		"
          ret += find_all_subpages(subcat)
          ret += '
                <!--[if lte IE 6]>
      		      </td></tr></table>
      		      </a>
      		      <![endif]-->
      		'
          ret += "</li>"
        else
          ret += "<li><a href='#{subcat.path}'>#{subcat_name}</a></li>"
        end
      end
      ret += "</ul>"
    end 
    ret
  end
  
  def add_style(page_name)
    str = ""
    if I18n.locale.to_s=="en"
      str = "style='width:#{page_name.length*7+18}px;'"
    end
    return str
  end
  
  def t_column(obj,column)
    obj["#{column}_#{I18n.locale.to_s.gsub('-','_').downcase}"]
  end
  
  def link_helper(label,url)
    url.strip!
    if url == "" || url == "#"
      label
    else
      raw "<a href='#{url}' target='_blank'>#{label}</a>"
    end
  end
end
