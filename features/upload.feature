Feature: Upload a print

  As a student
  So I can upload a print
  I want to go to a print page and upload my print

Scenario: When an authorized UIN is entered, a user can upload

  Given I am an admin or technician
  And I am on the Prints page
  And I fill UIN with "123456789"
  And I click "Upload"
  Then I should have a success
  And I should remain on the Prints page

Scenario: When an unauthorized UIN is entered, a user cannot upload

  Given I am on the Prints page
  And I fill UIN with "12345678910"
  And I click "Upload"
  Then I should have a warning
  And I should remain on the Prints page