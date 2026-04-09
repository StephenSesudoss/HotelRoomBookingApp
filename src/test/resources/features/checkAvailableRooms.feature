Feature: Create CheckAvailability API
  As an API user
  I want to check the room availability for bookings
  So that rooms can be reserved

  Background: User create an auth token
    When the user submits valid login credentials:
      | username | password |
      | admin    | password |
    Then the system should authenticate the user
    And the user should receive a valid session
    And session should be active until the auth token expires



