Feature: End to End Booking Flow
  As an API user
  I want to complete the End to End booking lifecycle
  So that the booking system works correctly

  Background: User create an auth token
    When the user submits valid login credentials:
      | username | password |
      | admin    | password |
    Then the system should authenticate the user
    And the user should receive a valid session
    And session should be active until the auth token expires

  # HOTEL ROOM BOOKING END TO END FLOW
  @positive @fullLifecycle @regression 
  Scenario Outline: Create, modify and cancel hotel room 
    Given user got the valid authorised application session
    When user creates booking with firstname "<firstname>" lastname "<lastname>" email "<email>" and phone "<phone>"
    Then response status code should be 200
    And booking id should be generated
    When user gets details by using generated booking id
    Then response status code should be 200
    When user modifies existing booking with firstname to "<modifyfirstname>" lastname to "<mofifylastname>" phone to "<modifyphone>" and email to "<modifyemail>" 
    Then booking should be modified successfully with response status code 200
    When user cancels the existing booking id
    Then system should cancelled the booking details
    And system should not be able to retrieve the booking details

    Examples:
      | firstname | lastname   | email                      | phone       | modifyfirstname | modifylastname | modifyphone | modifyemail          |
      | Olive     | May        | olivemay@gmail.com         | 09898980000 | Raellyn         | Turner         | 09901234568 | r.turner@gmail.com   |
      | Bruno     | Dzousa     | brunodzousa@hotmail.com    | 07834567090 | Jason           | Ally           | 09223456780 | jason.ally@gmail.com |
