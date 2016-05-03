# http://stackoverflow.com/questions/24267462/how-to-use-capybara-upload-file

Given /the following prints exist/ do |prints_table| 
  prints_table.hashes.each do |print| 
    Print.create!(print) 
  end
end 

Given /the following students exist/ do |students_table| 
  students_table.hashes.each do |student| 
    Student.create!(student) 
  end 
end 

Given /the following admins exist/ do |admins_table| 
  admins_table.hashes.each do |admin| 
    Admin.create!(admin) 
  end 
end 

Given(/^I am an admin or technician$/) do
  visit login_path
  fill_in('Username', :with => "jeff")
  fill_in('Password', :with => "jeff")
  click_button("Log in")
  visit prints_path
end

Given /^(?:|I )am on (.+)$/ do |page_name|
  visit path_to(page_name)
  #puts page.body # super important - much wow
end

Then(/^I should be on the Add New Student page$/) do
  visit new_student_path
end

Then(/^I should be on the Admin home page$/) do
  visit admins_path
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
  #page.driver.browser.switch_to.alert.accept
  driver.switch_to.alert.accept rescue Selenium::WebDriver::Error::NoAlertOpenError
  #@browser.alert.ok
  #page.driver.browser.switch_to.alert.dismiss
end

When(/^I click on "([^"]*)"$/) do |arg1|
  click_button(arg1)
end

Given(/^I should be on the Students page$/) do
  visit students_path
end

Given(/^I click the link "([^"]*)"$/) do |arg1|
  click_link(arg1)
end

Given(/^I click the table link "([^"]*)"$/) do |arg1|
  find('tr', text: download).click_link(arg1)
  puts page.body # super important - much wow
  #all('a').each { |a| a[:href] }
end

When(/^I fill username with "([^"]*)"$/) do |arg1|
  fill_in('Username', :with => arg1)
end

When(/^I fill password with "([^"]*)"$/) do |arg1|
  fill_in('Password', :with => arg1)
end

When(/^I fill UIN with "([^"]*)"$/) do |arg1|
  fill_in("UIN", :with => arg1)
end

Given(/^I fill Name with "([^"]*)"$/) do |arg1|
  fill_in('First name', :with => arg1)
end

Given(/^I fill First name with "([^"]*)"$/) do |arg1|
  fill_in('First name', :with => arg1)
end

Given(/^I fill Last name with "([^"]*)"$/) do |arg1|
  fill_in('Last name', :with => arg1)
end

Given(/^I fill Email with "([^"]*)"$/) do |arg1|
  fill_in('Email', :with => arg1)
end

Given(/^I click "([^"]*)"$/) do |arg1|
  click_button(arg1)
end

Given(/^I attach file$/) do
  attach_file('print_file', File.absolute_path('./test.txt'))
end