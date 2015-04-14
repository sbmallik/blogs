@ignore @uscp @blogs @blog-index
Feature: The blog index page contains the index to all blog landing page

Background:
        Given I am on the blog index headline grid page in module showcase

@blog-index-headline-grid
Scenario Outline:
       Given The headline grid module exists in the page
       When I click the headline grid thumbnail "<position>"
       Then The corresponding page displays

Examples:
| position |
| 3 |
| 4 |
