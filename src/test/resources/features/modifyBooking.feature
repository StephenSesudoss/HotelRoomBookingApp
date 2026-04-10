Feature: Modify Booking API
  As a authorized user of Booking app
  I want to edit an existing booking
  So that I can update guest and stay details

  Background: User create an auth token
    When the user submits valid login credentials:
      | username | password |
      | admin    | password |
    Then the system should authenticate the user
    And the user should receive a valid session
    And session should be active until the auth token expires

    
