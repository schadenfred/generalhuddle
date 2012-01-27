#---
# Excerpted from "Rails Test Prescriptions",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/nrtest for more book information.
#---
require 'test_helper'

class StatusReportTest < ActiveSupport::TestCase
  
  test "saving a status report saves the status date" do
    actual = StatusReport.new(:today => "t", :yesterday => "y")
    actual.save
    assert_equal(Date.today.to_s, actual.status_date.to_s) 
  end

  test "saving with a date doesn't override" do
    actual = StatusReport.new(:status_date => 10.days.ago.to_date,
        :today => "t", :yesterday => "y")
    actual.save
    actual.reload 
    assert_equal(10.days.ago.to_date.to_s, actual.status_date.to_s) 
  end
  
  test "a report with both blank is not valid" do
    actual = StatusReport.new(:today => "", :yesterday => "")
    assert !actual.valid?
  end
  
  test "a report with yesterday blank is valid" do
    actual = StatusReport.new(:today => "today", :yesterday => "")
    assert actual.valid?
  end
  
  test "a report with today blank is valid" do
    actual = StatusReport.new(:today => "", :yesterday => "yesterday")
    assert actual.valid?
  end
  
  test "by user name should sort as expected" do
    reports = StatusReport.by_user_name
    expected = reports.map { |r| r.user.email }
    assert_equal ["one@one.com", "one@one.com", 
        "two@two.com", "two@two.com"], expected
  end
  
end
