Given(/^I am an admin or technician$/) do
  visit login_path
  fill_in('Username', :with => "jeff")
  fill_in('Password', :with => "jeff")
  click_button("Log in")
end

Given /^(?:|I )am on (.+)$/ do |page_name|
  visit path_to(page_name)
end

Then(/^I should be on the Add New Student page$/) do
  visit new_student_path
end

Then(/^I should be on the Admin home page$/) do
  visit "/admins"
end

Then(/^I should be on the Login page$/) do
  visit login_path
end

Then(/^I should be on the Logout page$/) do
  visit logout_path
end

Then(/^I should be on the Queue page$/) do
  visit prints_queue_path
end

Then(/^I should be on the Prints page$/) do
  visit prints_path
end

Then(/^I should have a warning$/) do
  expect(find('.alert-danger'))
end

Then(/^I should have a success$/) do
  expect(find('.alert-success'))
end

Then(/^I should have a popup$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I click on "([^"]*)"$/) do |arg1|
  click_button(arg1)
end

Given(/^I click the link "([^"]*)"$/) do |arg1|
  click_link(arg1)
end

When(/^I fill username with "([^"]*)"$/) do |arg1|
  fill_in('Username', :with => arg1)
end

When(/^I fill password with "([^"]*)"$/) do |arg1|
  fill_in('Password', :with => arg1)
end

When(/^I fill UIN with "([^"]*)"$/) do |arg1|
  fill_in('UIN', :with => arg1)
  #fill_in "UIN", with: arg1, visible: false
end

Given(/^I fill Name with "([^"]*)"$/) do |arg1|
  fill_in('First name', :with => arg1)
end

Given(/^I fill Email with "([^"]*)"$/) do |arg1|
  fill_in('Email', :with => arg1)
end

Given(/^I click "([^"]*)"$/) do |arg1|
  click_button(arg1)
end

# Given(/^I fill filename with "([^"]*)"$/) do |arg1|
#   fill_in('print_filename', :with => arg1)
# end