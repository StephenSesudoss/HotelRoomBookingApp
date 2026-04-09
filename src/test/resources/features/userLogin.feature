Feature: UserAuthentication API
  Background:
    Given Booking API endpoint is available
    And request content type is "application/json"

  # VALID LOGIN CREDENTIALS
 @validLogin @regression
  Scenario Outline: Login successfully
    When user logged in with valid "<username>" and "<password>"
    Then response status code should be 200
    And auth token should be generated
    Examples:
      | username | password |
      | admin    | password |

  # INVALID LOGIN CREDENTIALS
  @invalidLogin
  Scenario Outline: Login with invalid credentials
    When user logged in with invalid "<username>" and "<password>"
    Then response status code should be 401
    And error message should contain "Invalid credentials"
    Examples:
      | username | password   | 
      | admin    | password12 |
      | admin1   | password   |
