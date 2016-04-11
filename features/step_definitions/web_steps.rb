Given(/^I am an admin or technician$/) do
  visit login_path
  fill_in('Username', :with => "jeff")
  fill_in('Password', :with => "jeff")
  click_button("Log in")
end

When(/^I click on "([^"]*)"$/) do |arg1|
  click_button(arg1)
end

When(/^I fill username with "([^"]*)"$/) do |arg1|
  fill_in('Username', :with => arg1)
end

When(/^I fill password with "([^"]*)"$/) do |arg1|
  fill_in('Password', :with => arg1)
end

Then(/^I should have a warning$/) do
  expect(find('.alert-danger'))
end

Then(/^I should have a success message$/) do
  expect(find('.alert-success'))
end

Then(/^I should remain on the Prints page$/) do
  visit path_to(prints_path)
end

When(/^I fill UIN with "([^"]*)"$/) do |arg1|
  fill_in('UIN', :with => arg1)
end

Given(/^I am on the Prints page$/) do
  visit prints_path
end

Then(/^I should be on the New student page$/) do
  visit new_student_path
end

Given(/^I am on the Add New Student page$/) do
  visit new_student_path
end

Given(/^I fill Name with "([^"]*)"$/) do |arg1|
  fill_in('First name', :with => arg1)
end

Given(/^I fill Email with "([^"]*)"$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^I am on the login page$/) do
  visit login_path
end

Then(/^I should be on the admin home page$/) do
  visit "/admins"
end

Then(/^I should be on the login page$/) do
  visit login_path
end

Given(/^I click "([^"]*)"$/) do |arg1|
  click_button(arg1)

end