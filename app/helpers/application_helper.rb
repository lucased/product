module ApplicationHelper
  
  def content_for_admin(&block)
    yield if current_user.admin?
  end
  
end
