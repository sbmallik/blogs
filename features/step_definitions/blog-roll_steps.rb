Given(/^I am on the blog roll page in module showcase$/) do
        visit ui_url('/module-showcase/blogs/')
        wait_for_pageload
end

Given(/^The blog roll module exists in the page$/) do
	expect(page).to have_css('.blogs-full-width-module')
end

When(/^I click the blog "(.*?)" page link "(.*?)" in blog roll$/) do | page_type, position |
	@target_page_element = all(page_type.downcase == 'landing' ? '.blogs-mod-index-link' : '.blogs-mod-headline-link')[position.to_i - 1]
        $expected_url = @target_page_element["href"]
        @target_page_element.click
end

Given(/^The right arrow exists in the blog roll$/) do
	expect(page).to have_css(".blogs-mod-scroller-right")
end

When(/^I click the right arrow$/) do
	find(".blogs-mod-scroller-right", match: :first).click
end

Then(/^The blog roll items shifts to the left$/) do
	expect(page.find('ul.clearfix.blogs-mod-list', match: :first)[:style]).to match "left: -1099px;"
end
