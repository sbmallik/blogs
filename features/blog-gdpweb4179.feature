@gdpweb4179
Feature: The Story GDPWEB-4179 inhibits the fall-back image display in the blog index page

Scenario:
Given I am visiting the "Victor Blog" blog landing page
Then I should see the fall-back image
	And I should not see an image with the most recent asset link
When I click on "See all Blogs" link
Then The blog index page should display
Then I should not see the fall-back image on "Victor Blog" landing page link
