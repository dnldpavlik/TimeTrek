Given(/^I have no tasks$/) do
  Task.delete_all
end

When(/^I go to (.+)$/) do | page_name |
  visit path_to(page_name) # express the regexp above with the code you wish you had
end

Then(/^I should not see any tasks$/) do
  Task.count.should == 0
end
