require_relative 'Tools'

# Background: login to appstack
Given /^I have login to appstack to create server$/ do
  #login_to_portal
  login_to_portal_s2(@driver)
  #begin
    #@driver.should have_content "Dashboard"
  #rescue RuntimeError
  #  login_to_portal_s2(@driver)
  #end
end

Given /^I stay at previous created workload design page$/ do
  wl_url = Tools.read_wlurl
  #visit wl_url
  @driver.get wl_url
end
And /^I click the "Create a Server" icon$/ do
  @driver.find_element(:id, "btnCreateServer").click
  #click_link('btnCreateServer').click
end
And /^I click Configure$/ do
  @driver.find_element(:id, "btnConfigure").click
  #click_link('btnConfigure')
end
Then /^I choose the Ubuntu 10.0.4 which server id is "(.*?)"$/ do |n|
  @driver.find_element(:id, n).click
  #select(n, :from => 'server[server_stack_id]')
end
When /^I press Next$/ do
  @driver.find_element(:id, "btnNext").click
end
Then /^I choose the "(.*?)" as server tier$/ do |n|
  @driver.find_element(:id, "server_tier_id").find_elements(:tag_name=>"option").find do |option|
    option.click if option.text == n
  end
  #select(n, :from => 'server[tier_id]')
end
And /^I enter "(.*?)" as name$/ do |n|
  @driver.find_element(:id, "server_name").clear
  @driver.find_element(:id, "server_name").send_keys n
  #select(n, :from => 'server[name]')
end
And /^I enter "(.*?)" as description$/ do |n|
  @driver.find_element(:id, "server_description").click
  @driver.find_element(:id, "server_description").clear
  @driver.find_element(:id, "server_description").send_keys n
  #select(n, :from => 'server[description]')
end
When /^I press Create$/ do
  @driver.find_element(:name, "commit").click
  #click_button('Create')
end
Then /^A new icon will shown at workload "(.*?)" tier$/ do |n|

end