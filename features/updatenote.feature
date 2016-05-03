Feature: Update a note on the student

  As an admin or technician
  So I can change the note of a student
  I want to go to the students page and /addchange the note of a student

Background: admins and students in database    

    Given the following admins exist: 

      | username | password | first_name | last_name |

      | jeff     | jeff     | jeff       | jeff      |

    Given the following students exist: 

      | uin       | email         | note |

      | 123456789 | jeff@tamu.edu | test |

@javascript
Scenario: When an admin is logged in, the admin can change the note for a student

  Given I am an admin or technician
  And I am on the Students page
  When I fill 123456789 with "5 stars"
  And I click "Save"
  Then I should have a popup
  And I should be on the Students page