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

  @checkAvailability @regression
  Scenario Outline: Check Room availability with valid future dates
    When User checks availability of rooms with "<check In>" "<check Out>" dates
    Then Response Status as 200
    And Response should provide list of available rooms to match with the dates
    
    Examples:
    | check In   | check Out  |
    | 2026-05-20 | 2026-05-26 |
    | 2026-05-02 | 2026-05-06 |


