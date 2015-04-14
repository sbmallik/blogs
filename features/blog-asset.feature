@ignore @uscp @blogs @blog-asset
Feature: The blog asset page features are contained in this page

Background:
        Given I am visiting a blog asset page

Scenario:
        Given I am on a blog asset page
        Then I should see the "Asset headline"
                And I should see the "Blog ribbon"
                And I should see the "Author link"
                And I should see the "Timestamp"
                And I should see the "Inline share tools"
                And I should see the "Tag Cloud"
                And I should see the "Author Headshot"
                And I should see the "Author Name"
#               And I should see the "Author short bio"
                And I should see the "More From"
                And I should see at least 3 assets in "More From" section
                And I should see the "Blog Landing Page link"
                And I should see the "More Stories"
                And I should see at least 3 assets in "More Stories" section
# Add the click on the tag cloud if exists
# use the following form 
# find('a.tgc'...).click unless first('.tag-cloud').nil?
	When I click the author name
	Then The corresponding page displays
#	When I click the first tag label
#	Then I should see the topic page
