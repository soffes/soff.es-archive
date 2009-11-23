Feature: Homepage
  In order to communicate recent activity
  As a viewer
  I want to see information about recent activity
  
  Scenario: See header
    When I go to the homepage
    Then I should see "Sam Soffes" within "h1"
