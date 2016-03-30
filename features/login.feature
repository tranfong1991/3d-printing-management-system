Feature: Login to Application

  As an admin
  So I can login to application
  I want to go to enter a correct username and password combination

Scenario: When correct login information is entered, a user logs in successfully

  Given I am on the login page
  When I fill username with "jeff"
  And I fill Password with "huang"
  And I press "Login"
  Then I should be on the Admin home page

Scenario: When incorrect login information is entered, a user cannot log in

  Given I am on the login page
  When I fill Email Address with "jefff"
  And I fill Password with "huang"
  And I press "Login"
  Then I should have a warning
  And I should be on the login page