Given(/^I am visiting a blog asset page$/) do
	visit ui_url('/story/vote-up/2015/04/03/money-for-bulletproof-equipment-tied-to-grand-jury-reforms/25258271/')
	wait_for_pageload
end

Given(/^I am on a blog asset page$/) do
	expect(page).to have_css('.asset.blog')
end

When(/I complete the google survey$/) do
	within_frame('t402-prompt-iframe') do
#	Enclose this with a for loop 
#	(0..10).each do |i|
#		if not first('.t402-response').nil?
#			find('.t402-response', match: :first).click
#		elsif not first('.t402-open-input').nil?
#			find('.t402-open-input').set('testing')
#			find('.t402-open-submit').click
#		elsif not first('.t402-multichoice-row').nil?		
#			find('.t402-multichoice-row', match: :first).click
#			find('.t402-open-multiselect-submit').click
#               elsif not first('.t402-ratings').nil?
#                       find('.t402-rating-star', match: :first).click
#		else
#			break
#		end
#	end
		while first('.t402-response').nil? do
			find(:id, 't402-task-flag').click
		end
		find('.t402-response', match: :first).click
	end unless first(:id, 't402-prompt-iframe').nil?
end

Then(/^The google survey disappears from the asset page$/) do
	expect(page).to have_no_css(:id, '.t402-prompt-iframe')
end

Then(/^I should see the "(.*?)"$/) do | page_element |
	@target_class = '.story-headline-module' if(page_element.downcase == 'asset headline')
	@target_class = '.asset-metabar-ribbon-link' if(page_element.downcase == 'blog ribbon')
	@target_class = '.asset-metabar-author' if(page_element.downcase == 'author link')
	@target_class = '.asset-metabar-time' if(page_element.downcase == 'timestamp')
	@target_class = '.asset-inline-share-tools' if(page_element.downcase == 'inline share tools')
	@target_class = '.blog-tag-cloud' if(page_element.downcase == 'tag cloud')
	@target_class = '.author-bio-displayname' if(page_element.downcase == 'author name')
	@target_class = '.author-bio-headshoot' if(page_element.downcase == 'author headshot')
	@target_class = '.author-bio-biography' if(page_element.downcase == 'author short bio')
	@target_class = '.more-blogs-h3' if(page_element.downcase == 'more from')
	@target_class = '.more-blogs-alllink' if(page_element.downcase == 'blog landing page link')
	@target_class = '.more-blogs-allposts' if(page_element.downcase == 'more stories')
	expect(page).to have_selector(@target_class)
end

Then(/^I should see at least 3 assets in "(.*?)" section$/) do | section_name |
	@target_class = '.more-blogs-info' if(section_name.downcase == 'more from')
	@target_class = '.more-section-stories-item' if(section_name.downcase == 'more stories')
	expect(page).to have_selector(@target_class, minimum: 3)
end

When(/^I click the author name$/) do
	click_page_link(".asset-metabar-author a")
end

Then(/^I should see the author page$/) do
	wait_for_pageload
	expect(current_url).to match($expected_url)
end
