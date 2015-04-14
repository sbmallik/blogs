@ignore @uscp @blogs @blog-roll
Feature: The blog roll display in front page to drive traffic to various blog landing pages

Background:
        Given I am on the blog roll page in module showcase

@blog-roll-links
Scenario Outline:
       Given The blog roll module exists in the page
       When I click the blog "<page_type>" page link "<position>" in blog roll
       Then The corresponding page displays

Examples:
| page_type | position |
| Landing | 2 |
| Asset | 3 |

@blog-roll-arrow
Scenario:
	Given The right arrow exists in the blog roll
	When I click the right arrow
	Then The blog roll items shifts to the left
