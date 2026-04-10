Feature: Get Room Booking details
  As a User
  I want to check the room booking details

  Background: User create an auth token
    When the user submits valid login credentials:
      | username | password |
      | admin    | password |
    Then the system should authenticate the user
    And the user should receive a valid session
    And session should be active until the auth token expires

  @getRoomBookingDetails
  Scenario: Get the room booking details
    Given the user check the room booking details
    When the user asks the room booking details for room "<room>"
    Then the room booking details response should be successful

    Examples:
      | room |
      |  1   |
      |  2   |
      |  3   |

  @negativeFlow @accessDenied
  Scenario: Unauthorized user tries to retrieve booking details
    Given the user is not authenticated
    When the user asks the room booking summary for room 1
    Then the system should deny access
    And the user should see an error message "Authentication error"  
