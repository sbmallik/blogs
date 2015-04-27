Given(/^I am visiting the "(.*?)" blog landing page$/) do | page_name |
	visit ui_url "/blog/#{page_name.gsub(/\s+/, "").downcase}"
end

Then(/^I should see the fall-back image$/) do
	expect(page).to have_css(".atbm-fallback-img")
end

Then(/^I should not see an image with the most recent asset link$/) do
	within(".blpm-post.active", match: :first) do
		expect(page).to have_no_css(".blpm-feature-image")
	end
end

When(/^I click on "(.*?)" link$/) do | link_name |
	if link_name.downcase == "see all blogs" 
		class_name = ".atbm-link-a"
	end
	click_page_link(class_name)
end

Then(/^The blog index page should display$/) do
	expect(current_url).to match($expected_url)
end

Then(/^I should not see the fall-back image on "(.*?)" landing page link$/) do | blog_name |
	link_name = "/blog/#{blog_name.gsub(/\s+/, "").downcase}/"
	expect(find("a[href='#{link_name}']")).to have_no_css(".bigpm-image-film")
end
