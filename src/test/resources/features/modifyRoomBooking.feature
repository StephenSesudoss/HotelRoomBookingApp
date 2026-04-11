Feature: Modify Room Booking API
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

  # SCENARIOS FOR MODIFY VALID BOOKING AND ROOM
  @positive @modifyBookingValid @regression @critical
  Scenario Outline: Modify booking successfully
    Given user is authenticated
    When user creates booking with check in "<check In>" check Out "<check Out>" firstname "<firstname>" lastname "<lastname>" email "<email>" and phone "<phone>"
    Then response status code should be 200
    And booking id should be generated
    When user modifies "<modifyfirstname>" "<mofifylastname>" "<modifyphone>" "<modifyemail>" by using generated booking id
    Then response status code should be 200
   
    Examples:
      | check In   | check Out  | firstname | lastname   | email                      | phone       | modifyfirstname | modifylastname | modifyphone | modifyemail          |
      | 2026-05-20 | 2026-05-26 | Olive     | May        | olivemay@gmail.com         | 09898980000 | Raellyn         | Turner         | 09901234568 | r.turner@gmail.com   |
      | 2026-06-20 | 2026-06-24 | Bruno     | Dzousa     | brunodzousa@hotmail.com    | 07834567090 | Jason           | Ally           | 09223456780 | jason.ally@gmail.com |

  # SCENARIOS FOR MODIFY VALID BOOKING WITH INVALID DATA
  @negative @modifyBookingInValid @regression 
  Scenario Outline: Modify booking with invalid details 
    Given user is authenticated
    When user creates booking with check in "<check In>" check Out "<check Out>" firstname "<firstname>" lastname "<lastname>" email "<email>" and phone "<phone>"
    Then response status code should be 200
    And booking id should be generated
    When user modifies "<modifyfirstname>" "<mofifylastname>" "<modifyphone>" "<modifyemail>" by using generated booking id
    Then response status code should be 400
   
    Examples:
      | check In   | check Out  | firstname | lastname   | email                      | phone       | modifyfirstname | modifylastname | modifyphone | modifyemail          |
      | 2026-05-20 | 2026-05-26 | Olive     | May        | olivemay@gmail.com         | 09898980000 | 8907650         | Turner         | 09901234568 | r.turner@gmail.com   |
      | 2026-06-20 | 2026-06-26 | Bruno     | Dzousa     | brunodzousa@hotmail.com    | 07834567090 | Jason           | %^&*           | 09223456780 | jason.ally@gmail.com |
      | 2026-07-10 | 2026-07-14 | Liam      | Walker     | liam.walker@test.com       | 09345678902 | Noah            | Lean           | phonenumber | noah.l@test.com      |
      | 2026-08-20 | 2026-08-26 | Lucas     | Nelson     | lucas.nelson@test.com      | 09445678902 | Logan           | M              | 09445670000 | loganm               | 

  # MODIFY WITHOUT AUTHENTICATION
  @modifyBookingAuthError @access
  Scenario: Modify Booking without authentication
    Given user creates booking with valid data
    And retrieve the booking by booking id
    When user modify booking without authentication
    Then the user should see an error message "Authentication error"
