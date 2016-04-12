Feature: Change status of print

  As an admin or technician
  So I can change the status of a print
  I want to go to a print queue page and change the status of prints

Scenario: When an admin is logged in, the admin can change the status

  Given I am an admin or technician
  And I am on the Queue page
  And I click "Start Print"
  Then I should have a popup
  And I should be on the Queue page