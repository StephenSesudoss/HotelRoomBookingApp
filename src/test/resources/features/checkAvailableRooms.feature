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


  @checkInaftercheckOut 
  Scenario Outline: create a booking when user give checkout date as earlier than check in date
    Given user got the valid authorised application session
    When User checks availability of rooms with "<check In>" "<check Out>" dates
    And user submits the booking 
    Then the system should return the "<error>" message 
    And user unable to complete the booking

    Examples:
      | firstname | lastname  | email                 | phone       | check In   | check Out  | error                    |
      | Aaron     | Brooks    | aaron.brooks@test.com | 09115671111 | 2026-05-30 | 2026-05-26 | Failed to create booking | 
      | Bella     | Cooper    | bella.cooper@test.com | 09229022222 | 2026-06-02 | 2026-05-06 | Failed to create booking | 
