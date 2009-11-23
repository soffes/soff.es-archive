Feature: Homepage
  In order to communicate recent activity
  As a viewer
  I want to see information about recent activity
  
  Scenario: See title in header
    When I go to the homepage
    Then I should see "Sam Soffes" within "h1"
    And I should see "I write software and make music." within "h2"
  
  Scenario: See the most recent post
    When I go to the homepage
  
  Scenario: See the most music
    When I go to the homepage
  
  Scenario: See the most recent GitHub activity
    When I go to the homepage
  
  Scenario: See the most recent Twitter update
    When I go to the homepage
  
  Scenario: See the most listened to artist of the week from Last.fm
    When I go to the homepage
