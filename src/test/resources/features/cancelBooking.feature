Feature: Cancel Booking API
  Background: User create an auth token
    When the user submits valid login credentials:
      | username | password |
      | admin    | password |
    Then the system should authenticate the user
    And the user should receive a valid session
    And session should be active until the auth token expires

  # CANCEL BOOKING
  @positiveFlow  @cancelValidBooking @regression
  Scenario: Cancel booking successfully
    Given user got the valid authorised application session
    When user creates booking with firstname "<firstname>" lastname "<lastname>" email "<email>" and phone "<phone>"
    Then response status code should be 200
    And booking id should be generated
    When user cancels booking by using booking id
    Then system should successfully cancel the booking details associated with the booking id 
    And the booking id shouldn't be available in the system
    
    Examples:
      | firstname | lastname  | email                   | phone       |
      | Olive     | May       | olivemay@gmail.com      | 09898980000 |
      | Bruno     | Dzousa    | brunodzousa@hotmail.com | 07834567090 |  
    
  # CANCEL UNAVAILABLE BOOKING AND ERROR MESSAGE
  @negativeFlow  @cancelUnavailableBooking
  Scenario: Cancel unavailable booking
    Given user got the valid authorised application session
    When user creates booking with firstname "<firstname>" lastname "<lastname>" email "<email>" and phone "<phone>"
    Then response status code should be 200
    And booking id should be generated
    When user cancels unavailable booking by using different booking id
    Then response status code should be 404
    And error message should contain "Not Found"
    
    Examples:
      | firstname | lastname  | email                 | phone       |
      | Aaron     | Brooks    | aaron.brooks@test.com | 09111111111 |
      | Bella     | Cooper    | bella.cooper@test.com | 09222222222 |

  # CANCEL BOOKING BY UNAUTHORISED USER
  @userAuthorisationError 
  Scenario: Unauthorised user trying to cancel booking
    Given user got the valid authorised application session
    When user creates booking with firstname "<firstname>" lastname "<lastname>" email "<email>" and phone "<phone>"
    Then response status code should be 200
    And booking id should be generated
    When the user attempts to cancel the booking without authentication
    Then the booking shouldn't be successfully cancelled
    And the user should see an error message "Authentication error"

    Examples:
      | firstname | lastname  | email                 | phone       |
      | Aaron     | Brooks    | aaron.brooks@test.com | 09111111111 |
      | Bella     | Cooper    | bella.cooper@test.com | 09222222222 |
