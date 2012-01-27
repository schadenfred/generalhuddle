#---
# Excerpted from "Rails Test Prescriptions",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/nrtest for more book information.
#---
class Project < ActiveRecord::Base
  
  has_many :status_reports

  def reports_grouped_by_day
    status_reports.by_user_name.group_by(&:status_date)
  end
  
end
