# Background: login to appstack
Given /^I login to appstack$/ do
  login_to_portal
end

And /^I click workloads to view all my Workloads$/ do
  visit WORKLOADS
end

# Scenario: Decommission the created Workload
Given /^I try to find the workload which i want to decommission$/ do
  sleep 3
end
And /^I click Decommission at the workload which name is "(.*?)"$/ do |n|
  #find(:css, "span.va-name").click
  #@driver.find_element(:xpath, "//div[@id='va-accordion']/div[2]/div[9]/h3/span").click
  elements = all('#wl-container .va-wrapper .va-slice-1 span.va-name', :text => n.upcase)
  if elements.size > 0
    elements[0].click
    sleep 1
    elements[0].find('.va-decomm').click
    #page.within_window page.driver.browser.window_handles.last do
    #  puts page.html
    #end
  else
    raise ObjectNotFoundException, "There is no workload with name #{n}"
  end
end
Then /^A dialog show me "(.*?)"$/ do |n|
  page.within_window page.driver.browser.window_handles.last do
    should have_content(n)
  end
end
When /^I click check box for "I acknowledge all servers will be permanently terminated and this action is non-recoverable"$/ do
  find(:css, "input.confirm1").click
end
And /^I click check box for "I acknowledge all data residing on the servers in this workload will be lost permanently"$/ do
  find(:css, "input.confirm2").click
end
Then /^The OK button should shown for me$/ do
  should have_button 'decomm-ok-btn'
end
When /^I click OK$/ do
  click_button 'decomm-ok-btn'
  sleep 1
end
Then /^I should see "Sending request to remove"$/ do

end