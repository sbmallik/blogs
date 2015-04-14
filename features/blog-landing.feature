@ignore @uscp @blogs @blog-landing
Feature: The blog landing page contains all blog assets for a specific topic

Background:
	Given I visit the blog landing page in module showcase

Scenario:
	Given I am on the blog landing page
	Then I should see the content module
		And I should see the blog title
		And I should see the blog short description
		And I should see the asset "title"
		And I may see the asset image
		And I should see the asset "byline"
		And I should see the asset "promo brief"
		And I should see the asset "link"
	When I click the "Show More Posts" button
	Then I should see at most 5 more assets
	When I click the first "Read full post" link
	Then The corresponding page displays
