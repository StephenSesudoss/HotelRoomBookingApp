Feature: Create Booking API
  As a Booking app user
  I want to create room bookings
  So that rooms can be reserved

  Background: User create an auth token
    When the user submits valid login credentials:
      | username | password |
      | admin    | password |
    Then the system should authenticate the user
    And the user should receive a valid session
    And session should be active until the auth token expires

  # SCENARIOS WITH VALID DETAILS
  @createValidBooking @regression 
  Scenario Outline: Create booking with valid data
    When User creates booking with "<firstname>" "<lastname>" "<check In>" "<check Out>" "<depositpaid>" "<email>" "<phone>"
    Then Response status should be 200
    And booking created successfully by showing bookingId
    And Response should match booking schema
    Examples:
| firstname | lastname  | check In   | check Out  | depositpaid | email               | phone        |
| Sarah     | Johnson   | 12-04-2026 | 16-04-2026 | true        | sarahj@gmail.com    | 09999706050  |
| Daniel    | Carter    | 15-05-2026 | 20-05-2026 | false       | Dcarter@hotmail.com | 08978906050  |

