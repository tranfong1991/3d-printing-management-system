Feature: Change status of print

  As an admin or technician
  So I can change the status of a print
  I want to go to a print queue page and change the status of prints

Background: admins, students, and prints in database    

    Given the following admins exist: 

      | username | password | first_name | last_name |

      | jeff     | jeff     | jeff       | jeff      |

    Given the following students exist: 

      | uin       | email         | note |

      | 012345678 | jeff@tamu.edu | test |

    Given the following prints exist: 

      | uin       | status  |       created_at          | filename |

      | 123456789 | pending |   2016-04-11 22:48:27 UTC | test.txt |

      | 123456789 | started |   2016-04-11 22:48:27 UTC | test.txt |

      | 123456789 | aborted |   2016-04-11 22:48:27 UTC | test.txt |

@javascript
Scenario: When an admin is logged in, the admin can change the status to started

  Given I am an admin or technician
  And I am on the Queue page
  And I click "Start Print"
  Then I should have a popup
  And I should be on the Queue page

@javascript
Scenario: When an admin is logged in, the admin can change the status to complete

  Given I am an admin or technician
  And I am on the Queue page
  And I click "Complete"
  Then I should have a popup
  And I should be on the Queue page

@javascript
Scenario: When an admin is logged in, the admin can change the status to abort

  Given I am an admin or technician
  And I am on the Queue page
  And I click "Abort"
  Then I should have a popup
  And I should be on the Queue page

@javascript
Scenario: When an admin is logged in, the admin can change the status of aborted print to restart

  Given I am an admin or technician
  And I am on the Queue page
  And I click "Restart"
  Then I should have a popup
  And I should be on the Queue page

@javascript
Scenario: When an admin is logged in, the admin can change the status of aborted print to cancel

  Given I am an admin or technician
  And I am on the Queue page
  And I click "Cancel"
  And I should be on the Queue page