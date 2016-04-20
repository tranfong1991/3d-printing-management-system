Feature: Logout to Application

  As an admin
  So I can log out of the application
  I want to click a link that logs me out

Background: admins in database    

    Given the following admins exist: 

      | username | password | first_name | last_name |

      | jeff     | jeff     | jeff       | jeff      |

Scenario: When logout is clicked, an admin is taken to prints page

  Given I am an admin or technician
  And I am on the Prints page
  And I click the link "Log out"
  Then I should be on the Prints page