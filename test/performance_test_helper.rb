#---
# Excerpted from "Rails Test Prescriptions",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/nrtest for more book information.
#---
ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
Rails.env = "performance"
ActiveRecord::Base.establish_connection

require 'ap'

class ActiveSupport::TestCase
  
  include ActionController::RecordIdentifier
  
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...
    
  def login_as_one
    sign_in(users(:one))
  end
  
  def set_current_project(symbol)
    @request.session[:project_id] = projects(symbol).id
  end
    
end

class ActionController::TestCase
    include Devise::TestHelpers
  end
