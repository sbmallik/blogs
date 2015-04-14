Given(/^I am on the blog index hero page in module showcase$/) do
	visit ui_url('/module-showcase/blogs-index-latest-hero/')
	wait_for_pageload
end

Given(/^The hero "(.*?)"up module exists in the page$/) do | hero_type |
	if hero_type.to_i == 3
		@hero_type_element = find('.bihpm-hero-wrapper', match: :first)
	elsif hero_type.to_i == 1
		@hero_type_element = find('.bihpm-hero-wrapper-1-up')
	else
		puts "Hero module type not supported"
	end
end

When(/^I click the "(.*?)" page link "(.*?)"$/) do | asset, position |
#	within('.bihpm-hero-wrapper', match: :first) do
	@hero_position = @hero_type_element.all('.bihpm-hero-story')[position.to_i - 1]
	@blog_asset_link = @hero_position.find(asset == 'Asset' ? '.bihpm-recent-text-a' : '.bihpm-text-read-more')
	$expected_url = @blog_asset_link["href"]
	@blog_asset_link.click
#	end
end

Then(/^The corresponding page displays$/) do
	expect(current_url).to match($expected_url)
end
