require 'cgi'

module ApplicationHelper
  
  def content_for_admin(&block)
    yield if admin?
  end
  
  def user_login
    if current_user 
      link_to "logout", logout_path
    else
      link_to "login", login_path
    end
  end
  
  def safe_stylesheet_link_tag
    if File.exists?("#{Rails.root.to_s}/app/assets/stylesheets/#{controller_name}.css")
      stylesheet_link_tag("application", controller_name) 
    else 
      stylesheet_link_tag("application")
    end
  end
  
  def link_to_sub_category_search term
    link_to term, "/products/sub_category_search/#{term}"
  end
  
  def link_to_category_search term
    link_to term, "/products/category_search/#{term}"
  end
end
