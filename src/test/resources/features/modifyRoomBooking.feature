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

  # SCENARIOS FOR MODIFY VALID BOOKING AND ROOM
  @modifyBookingValid @regression 
  Scenario Outline: Modify booking successfully
    Given user is authenticated
    When user creates booking with firstname "<firstname>" lastname "<lastname>" email "<email>" and phone "<phone>"
    Then response status code should be 200
    And booking id should be generated
    When user modifies "<modifyfirstname>" "<mofifylastname>" "<modifyphone>" "<modifyemail>" by using generated booking id
    Then response status code should be 200
   
    Examples:
      | firstname | lastname   | email                      | phone       | modifyfirstname | modifylastname | modifyphone | modifyemail          |
      | Olive     | May        | olivemay@gmail.com         | 09898980000 | Raellyn         | Turner         | 09901234568 | r.turner@gmail.com   |
      | Bruno     | Dzousa     | brunodzousa@hotmail.com    | 07834567090 | Jason           | Ally           | 09223456780 | jason.ally@gmail.com |

  # SCENARIOS FOR MODIFY VALID BOOKING WITH INVALID DATA
  @modifyBookingInValid @regression 
  Scenario Outline: Modify booking with invalid details 
    Given user is authenticated
    When user creates booking with firstname "<firstname>" lastname "<lastname>" email "<email>" and phone "<phone>"
    Then response status code should be 200
    And booking id should be generated
    When user modifies "<modifyfirstname>" "<mofifylastname>" "<modifyphone>" "<modifyemail>" by using generated booking id
    Then response status code should be 200
   
    Examples:
      | firstname | lastname   | email                      | phone       | modifyfirstname | modifylastname | modifyphone | modifyemail          |
      | Olive     | May        | olivemay@gmail.com         | 09898980000 | 8907650         | Turner         | 09901234568 | r.turner@gmail.com   |
      | Bruno     | Dzousa     | brunodzousa@hotmail.com    | 07834567090 | Jason           | %^&*           | 09223456780 | jason.ally@gmail.com |
      | Liam      | Walker     | liam.walker@test.com       | 09345678902 | Noah            | Lean           | phonenumber | noah.l@test.com      |
      | Lucas     | Nelson     | lucas.nelson@test.com      | 09445678902 | Logan           | M              | 09445670000 | loganm               | 

  # MODIFY WITHOUT AUTHENTICATION
  @modifyBookingAuthError
  Scenario Outline: Modify Booking without authentication
    Given user creates booking with valid data
    And retrieve the booking by booking id
    When user modify booking without authentication
    Then the user should see an error message "Authentication error"
