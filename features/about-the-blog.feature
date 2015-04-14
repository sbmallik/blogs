@ignore @uscp @blogs @about-this-blog
Feature: About the blog module in the blog landing page briefs about the blog topic

Scenario:
	Given I am viewing the About This Blog in module showcase
	Then I should see the blog default image
		And I should see the blog name
		And I should see the blog description
		And I should see the See All Blogs link
		And The link contains "/blogs/" text
