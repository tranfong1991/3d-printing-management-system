Feature: Add Student

  As an admin or technician
  So I can add a student
  I want to go to an add student page and create a new student account

Scenario: When Add new student link is clicked, new student page is rendered

  Given I am an admin or technician
  And I am on the Prints page
  And I click the link "Add"
  Then I should be on the New student page

Scenario: When information is inputted into new student fields, and they are saved, then a new student is created

  Given I am an admin or technician
  And I am on the Add New Student page
  And I fill UIN with "123456"
  And I fill Name with "Rafa"
  And I fill Email with "rafa@tamu.edu"
  And I click the link "Add"
  Then I should have a success
  Then I should be on the New student page