#---
# Excerpted from "Rails Test Prescriptions",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/nrtest for more book information.
#---
Given /^a project named "(.*)"$/ do |project_name|
  @project = Project.create!(:name => project_name)
end

Given /^the following users$/ do |user_data|
  User.create!(user_data.hashes)
end

Given /^that user "(.*)" is a member of the project$/ do |login|
  User.find_by_login(login).projects << @project
end

When /^I visit the edit page for the project$/ do
  visit("/projects/#{@project.id}/edit")
end

Then /^I should see (.*) checkboxes$/ do |checkbox_count|
  page.has_css?("input[type = checkbox][id *= user]", 
      :count => checkbox_count.to_i)
end

Then /^I am taken to (.*)$/ do |path|
  assert(current_url.ends_with?(path_to(path)))
end


