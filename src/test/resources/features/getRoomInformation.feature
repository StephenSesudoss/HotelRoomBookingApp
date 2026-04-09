Feature: View all the hotel room details 
As a Hotel booking Application
I have to provide clear and accurate room details

Background: User create an auth token
    When the user submits valid login credentials:
      | username | password |
      | admin    | password |
    Then the system should authenticate the user
    And the user should receive a valid session
    And session should be active until the auth token expires
