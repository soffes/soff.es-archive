Feature: Manage Posts
  In order to make a blog
  As an author
  I want to create and manage posts

  Scenario: Posts list
    Given the following posts exist
      | title        | content                           |
      | Connect Four | Connect Four is a fun game.       |
      | Sequence     | Sequence is a game my mom enjoys. |
    When I go to path "/posts"
    Then I should see "Connect Four"

  Scenario: Show post
    Given a post exists with title: "Pizza", content: "I enjoy pickles."
    When I go to the show page for that post
    Then I should see "Pizza"
    And I should see "I enjoy pickles."

  Scenario: Create Valid Post
    Given I have no posts
    And I am on the list of posts
    When I follow
