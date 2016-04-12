Feature: Logout to Application

  As an admin
  So I can log out of the application
  I want to click a link that logs me out

Scenario: When logout is clicked, an admin is taken to prints page

  Given I am an admin or technician
  And I am on the Admins page
  And I click the link "Log out"
  Then I should be on the logout page