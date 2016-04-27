Feature: Upload a print

  As a student
  So I can upload a print
  I want to go to a print page and upload my print

Background: students in database    

    Given the following students exist: 

      | uin       | email            | note |

      | 123456789 | student@tamu.edu | test |

Scenario: When an authorized UIN is entered, a user can upload

  Given I am an admin or technician
  And I am on the Prints page
  And I fill UIN with "123456789"
  And I attach file
  And I click "Upload"
  Then I should have a success
  And I should be on the Prints page

Scenario: When an unauthorized UIN is entered, a user cannot upload

  Given I am an admin or technician
  And I am on the Prints page
  And I fill UIN with "12345678910"
  And I attach file
  And I click "Upload"
  Then I should have a warning
  And I should be on the Prints page