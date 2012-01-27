#---
# Excerpted from "Rails Test Prescriptions",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/nrtest for more book information.
#---
class ApplicationController < ActionController::Base
  protect_from_forgery
  layout 'application'
  
  before_filter :authenticate_user!
  
  helper_method :current_project
  def current_project
    project = Project.find(session[:project_id]) rescue Project.last
  end
  
  def redirect_if_not_current_user(user_id)
    if user_id && user_id != current_user.id
      sign_out(current_user)
      redirect_to new_user_session_path
      return true
    end
    false
  end
end
