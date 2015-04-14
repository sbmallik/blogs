@ignore @uscp @blogs @blog-index
Feature: The blog index page contains the index to all blog landing page

Background:
	Given I am on the blog index hero page in module showcase

@blog-index-hero
Scenario Outline: 
	Given The hero "<hero_type>"up module exists in the page
	When I click the "<page_type>" page link "<position>"
	Then The corresponding page displays

Examples:
| hero_type | page_type | position |
| 3 | Blog Landing | 1 |
| 3 | Asset | 2 |
| 1 | Blog Landing | 1 |
| 1 | Asset | 1 |
