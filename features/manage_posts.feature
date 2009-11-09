Feature: Manage Posts
  In order to make a blog
  As an author
  I want to create and manage posts

  Scenario: Posts list
    Given the following posts exist
      | title        | content                           |
      | Connect Four | Connect Four is a fun game.       |
      | Sequence     | Sequence is a game my mom enjoys. |
    When I go to the list of posts
    Then I should see "Connect Four"

  Scenario: Show post
    Given a post exists with title: "Pizza", content: "I enjoy pickles."
    When I go to the show page for that post
    Then I should see "Pizza" within "div.post h2"
    And I should see "I enjoy pickles." within "div.post"

  Scenario: Create a valid post
    Given I have no posts
    And I am on the list of posts
    When I follow "New Post"
    And I fill in "Title" with "Monkeys"
    And I fill in "Content" with "Wonderful creatures, they are."
    And I press "Create"
    Then I should see "New post created."
    And I should see "Monkeys" within "div.post h2"
    And I should see "Wonderful creatures, they are." within "div.post"
    And I should have 1 post
