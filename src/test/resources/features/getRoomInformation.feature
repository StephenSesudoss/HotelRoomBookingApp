Feature: View all the hotel room information 
  As a Hotel booking Application
  I have to provide clear and accurate room details

  Background: User create an auth token
    When the user submits valid login credentials:
      | username | password |
      | admin    | password |
    Then the system should authenticate the user
    And the user should receive a valid session
    And session should be active until the auth token expires

  @positiveFlow @roomInformation @availableRoom @regression
  Scenario Outline: Guest views details of an available hotel room
    Given the hotel offers rooms for booking
    When the guest requests details for room number "<room>"
    Then the system should provide the room information for room number "<room>"
    And the room should have name and description
    And the room should display its price per night
    And the room should list the features available to the guest
    
    Examples:
      | room |
      |  1   |
      |  2   |
      |  3   |

  @negativeFlow    @UnavailableRoom
  Scenario Outline: Guests try to view details of unavailable room
    Given the hotel offers rooms for booking
    When the guest requests details for a room number "<room>"
    Then the system should inform the guest that the room could not be found
    
    Examples:
      |  room  |
      | 100001 |
      |   -2   |
