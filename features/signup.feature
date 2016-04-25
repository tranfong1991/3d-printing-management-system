Feature: Signup to Application

  As a potential admin
  So I can sign up to control applicaiton
  I want to click a link that takes me to a sign up form

Scenario: When sign up is clicked, an admin is taken to sign up page

  Given I am on the Signup page
  When I fill First name with "testfirst"
  When I fill Last name with "testlast"
  When I fill username with "testuser"
  When I fill password with "testpassword"
  And I click on "Create an account"
  And I should be on the Admin home page