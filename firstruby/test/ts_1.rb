
Given /^I visit the expedia home page$/ do
  @page = HotelSearch.new
  @page.visit!
end

When /^I find a hotel near "([^"]*)"$/ do |near_type|
  @page.select_radio_hotel
  @page.select_near_type near_type
end

When /^my destination is "([^"]*)"$/ do |destination|
  @page.input_to_destination destination
end

When /^the book date is from "([^"]*)" to "([^"]*)"$/ do |check_in, check_out|
  @page.input_to_check_in check_in
  @page.input_to_check_out check_out
end

When /^"([^"]*)" rooms I want to book$/ do |num_of_rooms|
  @page.select_number_of_room num_of_rooms
end

When /^there are (\d+) adults and (\d+) child in room(\d+)$/ do |adult_num, child_num, room_num|

  @page.send("select_adults_num_in_room#{room_num}", adult_num)
  @page.send("select_children_num_in_room#{room_num}", child_num)
end

When /^the age of the child is (\d+)$/ do |age|
  @page.select_the_age_of_child1_in_room1 age
end

When /^there are (\d+) adults and (\d+) children in room(\d+)$/ do |adult_num, child_num, room_num|
  @page.send("select_adults_num_in_room#{room_num}", adult_num)
  @page.send("select_children_num_in_room#{room_num}", child_num)
end

When /^the age of (\d+) children is (\d+) and (\d+) years old$/ do |num, age1, age2|
  @page.select_the_age_of_child1_in_room2 age1
  @page.select_the_age_of_child2_in_room2 age2
end

When /^I submit the search$/ do
  @page.save_fields_value
  @page.click_search_for_hotel_link
end

Then /^I go to the hotel search page$/ do
  @page.verify_correct_forward
end

When /^I return to home page$/ do
  @page.click_home_link
end

Then /^I can find my query builder in the related area$/ do
  @page.verify_the_query_builder
end