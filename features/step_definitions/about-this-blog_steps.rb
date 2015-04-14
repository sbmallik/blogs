Given(/^I am viewing the About This Blog in module showcase$/) do
	visit ui_url "/module-showcase/about-this-blog/"
	wait_for_pageload
end

Then(/^I should see the blog default image$/) do
	expect(page).to have_css('.atbm-fallback-img')
end

Then(/^I should see the blog name$/) do
	expect(page).to have_css('.atbm-h3')
end

Then(/^I should see the blog description$/) do
	expect(page).to have_css('.atbm-description')
end

Then(/^I should see the See All Blogs link$/) do
	expect(page).to have_css('.atbm-link-a')
end

Then(/^The link contains "(.*?)" text$/) do | match_text |
	expect(page.find('.atbm-link-a')[:href]).to include(match_text)
end
