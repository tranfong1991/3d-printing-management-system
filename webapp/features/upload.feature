Feature: Upload a print

  As a student
  So I can upload a print
  I want to go to a print page and upload my print

Scenario: When an authorized UIN is entered, a user can upload

  Given I am on the Prints page
  When I fill UIN with "123456789" and browse for "file.gcode"
  And I press "Upload"
  Then I should get a message - "Uploaded name.extension for Jeff Huang: 123456789 "
  And I should remain on the Prints page

Scenario: When an unauthorized UIN is entered, a user cannot upload

  Given I am on the Prints page
  When I fill UIN with "12345678910"
  And I press "Upload"
  Then I should have a warning - "You are not authorized to print"
  And I should remain on the Prints page