Feature: Change status of print

  As an admin or technician
  So I can change the status of a print
  I want to go to a print queue page and change the status of prints

Background: admins in database    

    Given the following admins exist: 

      | username | password | first_name | last_name |

      | jeff     | jeff     | jeff       | jeff      |

    Given the following students exist: 

      | uin       | name  | email | note |

      | 123456789 | hello | world | test |

    Given the following prints exist: 

      | uin       | status  |       created_at          | filename |

      | 123456789 | started |   2016-04-11 22:48:27 UTC | test.txt |

Scenario: When an admin is logged in, the admin can change the status

  Given I am an admin or technician
  And I am on the Queue page
  And I click "Complete"
  Then I should have a popup
  And I should be on the Queue page