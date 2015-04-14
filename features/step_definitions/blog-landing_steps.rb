Given(/^I visit the blog landing page in module showcase$/) do
	visit ui_url('/module-showcase/blog-list/')
	wait_for_pageload
end

Given(/^I am on the blog landing page$/) do
	expect(page).to have_css('.blog-list-module')
end

Then(/^I should see the content module$/) do
	expect(page).to have_selector('.blpm-all-articles')
end

Then(/^I should see the blog title$/) do
	expect(page).to have_selector('.blpm-logo')
end

Then(/^I should see the blog short description$/) do
	expect(page).to have_selector('.blpm-short-desc')
end

Then(/^I should see the "(.*?)" button$/) do | button_name |
	expect(page.find('.button-add-content')[:text]).to match(button_name)
end

Then(/^I should see the asset "(.*?)"$/) do | asset_element |
	@target_class = case asset_element.downcase
		when 'title' then '.blpm-title'
		when 'byline' then '.blpm-byline'
		when 'promo brief' then '.blpm-content-p'
		when 'link' then '.blpm-content-p-link'
	end
	expect(page).to have_selector(@target_class, count: 5)
end

Then(/^I may see the asset image$/) do
	expect(page).to have_selector('.blpm-feature-image', maximum: 5)
end

When(/^I click the "(.*?)" button$/) do | button_name |
	find('a', text: button_name).click
end

Then(/^I should see at most 5 more assets$/) do
	expect(page).to have_selector('.blpm-post', between: 5..10)
end

When(/^I click the first "(.*?)" link$/) do | link_name |
	@section = find('a', text: link_name, match: :first)
	$expected_url = @section["href"]
	@section.click
end
