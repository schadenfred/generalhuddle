#---
# Excerpted from "Rails Test Prescriptions",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/nrtest for more book information.
#---
class StatusReport < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  
  before_save :set_status_date
  
  validate :validate_has_at_least_one_status
  
  def validate_has_at_least_one_status
    if today.blank? && yesterday.blank?
      errors[:base] << "Must have at least one status set"
    end 
  end
  
  scope :by_user_name, :include => "user", 
      :order => "users.email ASC",
      :conditions => "user_id IS NOT NULL"

  def set_status_date
    self.status_date = Date.today if status_date.nil?
  end

end
