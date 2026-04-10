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
  @positiveFlow @createValidBooking @regression 
  Scenario Outline: Create booking with valid data
    When User creates booking with "<firstname>" "<lastname>" "<check In>" "<check Out>" "<depositpaid>" "<email>" "<phone>"
    Then Response status should be 200
    And booking created successfully by showing bookingId
    And Response should match booking schema
    
    Examples:
| firstname | lastname  | check In   | check Out  | depositpaid | email               | phone        |
| Sarah     | Johnson   | 2026-06-01 | 2026-06-05 | true        | sarahj@gmail.com    | 09999706050  |
| Daniel    | Carter    | 2026-05-02 | 2026-05-06 | false       | Dcarter@hotmail.com | 08978906050  |

 # SCENARIOS WITH INVALID DETAILS
  @negativeFlow @createInvalidBooking @ErrorValidation
  Scenario Outline: Create booking with invalid data
    When User creates booking with "<firstname>" "<lastname>" "<check In>" "<check Out>" "<depositpaid>" "<email>" "<phone>"
    And the user gets "<error>" error message
    Then Response status should be <status>
    
    Examples:
| firstname                   | lastname                       | check In   | check Out  | depositpaid | email                   | phone                  | status | error                                  |
|                             | Smith                          | 2026-06-01 | 2026-06-05 | true        | smith@test.com          | 09999789080            | 400    | first name should not be blank         |
| Jason                       |                                | 2026-05-01 | 2026-05-05 | false       | jason@gmail.com         | 09999789089            | 400    | last name should not be blank          |
| Jo                          | Brown                          | 2026-05-02 | 2026-05-06 | true        | jo@test.com             | 09876543210            | 400    | first name length should be minimum 3  |
| Michael                     | Li                             | 2026-06-03 | 2026-06-07 | false       | michael@test.com        | 09876543211            | 400    | last name length should be minimum 3   |
| ChristopherAlexanderJonathan| White                          | 2026-07-04 | 2026-07-08 | true        | chris@test.com          | 09876543212            | 400    | first name length should not exceed 30 |
| Emma                        | RobertsonWilliamsJohnsonSmith  | 2026-08-05 | 2026-08-09 | false       | emma@test.com           | 09876543213            | 400    | last name length should not exceed 30  |
| David                       | Miller                         | 2026-09-06 | 2026-09-10 | true        |                         | 09876543214            | 400    | must not be empty                      |
| Sarah                       | Wilson                         | 2026-08-07 | 2026-08-11 | false       | sarahwilson.com         | 09876543215            | 400    | must be a well-formed email address    |
| Daniel                      | Moore                          | 2026-09-08 | 2026-09-12 | true        | daniel@test.com         |                        | 400    | phone should not be blank              |
| Olivia                      | Taylor                         | 2026-10-09 | 2026-10-13 | false       | olivia@test.com         | 1234567890             | 400    | phone length should be minimum 11      |
| James                       | Anderson                       | 2026-11-10 | 2026-11-14 | true        | james@test.com          | 1234567890123456789012 | 400    | phone length should not exceed 21      |

  @createInvalidBookingRoom @errorValidation
  Scenario Outline: Create booking with invalid room numbers
    When user creates booking for room "<room>"
    Then response status code should be 400
    And error message as "must be greater than or equal to 1"
    Examples:
| room  |
| XYZ   |
| -1001 |
| 000   |
| 9999  |
| -50   |
| 12A   |
| -9999 |
