Feature: Add Student

  As an admin or technician
  So I can add a student
  I want to go to an add student page and create a new student account

Background: admins in database    

    Given the following admins exist: 

      | username | password | first_name | last_name |

      | jeff     | jeff     | jeff       | jeff      |

Scenario: When Add new student link is clicked, new student page is rendered

  Given I am an admin or technician
  And I am on the Prints page
  And I click the link "Add"
  Then I should be on the Add New Student page

Scenario: When information is inputted into new student fields, and they are saved, then a new student is created

  Given I am an admin or technician
  And I am on the Add New Student page
  And I fill UIN with "123456"
  And I fill First name with "Rafa"
  And I fill Last name with "Moreno"
  And I fill Email with "rafa@tamu.edu"
  And I click "Add"
  Then I should have a success
  Then I should be on the Add New Student page