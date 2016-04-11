Feature: Login to Application

  As an admin
  So I can login to application
  I want to go to enter a correct username and password combination

Scenario: When correct login information is entered, an admin logs in successfully

  Given I am on the login page
  When I fill username with "jeff"
  And I fill password with "jeff"
  And I click on "Log in"
  Then I should be on the admin home page

Scenario: When incorrect login information is entered, an admin cannot log in

  Given I am on the login page
  When I fill username with "jeff"
  And I fill password with "jefff"
  And I click on "Log in"
  Then I should have a warning
  And I should be on the login page