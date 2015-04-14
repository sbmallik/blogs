Given(/^I am on the blog index headline grid page in module showcase$/) do
        visit ui_url('/module-showcase/blogs-index-grid/')
        wait_for_pageload
end

Given(/^The headline grid module exists in the page$/) do
        find('.bigpm-grid-wrapper')
end

When(/^I click the headline grid thumbnail "(.*?)"$/) do | position |
        @headline_grid_thumbnail_selected = all('.bigpm-link.bigpm-white-font')[position.to_i - 1]
        $expected_url = @headline_grid_thumbnail_selected["href"]
        @headline_grid_thumbnail_selected.click
end
