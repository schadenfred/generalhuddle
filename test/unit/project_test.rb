#---
# Excerpted from "Rails Test Prescriptions",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/nrtest for more book information.
#---
require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  test "should be able to retrieve projects based on day" do
    actual = projects(:huddle).reports_grouped_by_day
    expected_keys = actual.keys.sort.map{ |d| d.to_s(:db) }
    assert_equal(["2009-01-06", "2009-01-07"], expected_keys)
    assert_equal([status_reports(:one_tue).id, status_reports(:two_tue).id],
        actual[Date.parse("2009-01-06")].map(&:id))
  end
end
