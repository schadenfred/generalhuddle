#---
# Excerpted from "Rails Test Prescriptions",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/nrtest for more book information.
#---
require 'test_helper'
require 'rails/performance_test_help'

class HuddlePerformanceTest < ActionDispatch::PerformanceTest
  # Replace this with your real tests.


  test "projects page" do
    get projects_path
  end
  
  test "show a project" do
    get projects_path(:id => 1)
  end
  
  test "status reports page" do
    get status_reports_path
  end

end
