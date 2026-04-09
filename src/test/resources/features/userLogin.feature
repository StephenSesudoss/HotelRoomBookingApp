Feature: UserAuthentication API
  Background:
    Given Booking API endpoint is available
    And request content type is "application/json"

  # VALID LOGIN CREDENTIALS
 @validLogin @regression
  Scenario Outline: Login successfully
    When user logged in with valid username and password
    Then response status code should be 200
    And auth token should be generated
    Examples:
      | username | password |
      | admin    | password |
