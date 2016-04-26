Feature: Signup to Application

  As an admin or technician
  So I can view all authorized students
  I want to click a link that takes me to this page

Background: admins in database    

    Given the following admins exist: 

      | username | password | first_name | last_name |

      | jeff     | jeff     | jeff       | jeff      |

    Given the following students exist: 

      | uin       | email            | note |

      | 123456789 | student@tamu.edu | test |


Scenario: When View authorized students is clicked, an admin is taken to this page

  Given I am an admin or technician
  And I am on the Admin home page
  And I click the link "View authorized students"
  And I should be on the Students page