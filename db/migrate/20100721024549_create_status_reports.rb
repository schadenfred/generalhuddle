#---
# Excerpted from "Rails Test Prescriptions",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/nrtest for more book information.
#---
class CreateStatusReports < ActiveRecord::Migration
  def self.up
    create_table :status_reports do |t|
      t.references :project
      t.references :user
      t.text :yesterday
      t.text :today
      t.date :status_date

      t.timestamps
    end
  end

  def self.down
    drop_table :status_reports
  end
end
