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
