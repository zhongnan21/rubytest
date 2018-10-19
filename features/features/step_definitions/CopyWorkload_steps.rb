# Background: login to appstack
Given /^To copy a workload, I login to appstack$/ do
  login_to_portal
end

And /^To copy a workload, I click workloads to view all my Workloads$/ do
  visit WORKLOADS
end

# Scenario: Decommission the created Workload
Given /^I try to find the workload which i want to copy/ do
  sleep 3
end
And /^I click copy at the workload which name is "(.*?)"$/ do |s|
  s.upcase!
  elements = all('#wl-container .va-wrapper .va-slice-1 span.va-name', :text => s)
  for e in elements
    if e.text == s
      e.click
      sleep 1
      copys = all(:link, "Copy") # find all copy link in a page
      if copys.size > 0
        0.upto(copys.size - 1) do |n|
          if copys[n].visible? # the workload we click only will be visible
            copys[n].click
            break
          end
        end
      end
      break
    end
  end
  raise(ObjectNotFoundException, "There is no workload with name #{s}") if elements.size == 0
  #if elements.size > 0
  #  elements[0].click
  #  sleep 1
  #  copys = all(:link, "Copy") # find all copy link in a page
  #  if copys.size > 0
  #    0.upto(copys.size - 1) do |n|
  #      if copys[n].visible? # the workload we click only will be visible
  #        copys[n].click
  #        break
  #      end
  #    end
  #  end
  #else
  #  raise ObjectNotFoundException, "There is no workload with name #{s}"
  #end
end
Then /^A page show title "(.*?)" and show "(.*?)"$/ do |s1, s2|
  should have_content(s1)
  should have_content(s2)
end
And /^The page should have a scene of "(.*?)"$/ do |s|
  should have_link s
end
When /^I enter "(.*?)" as Name$/ do |s|
  fill_in('name', :with => s)
end
And /^I enter "(.*?)" as Description$/ do |s|
  time = Time.new
  dynamic_desc = s.sub(/TODAY_DATE/, time.strftime("%Y-%m-%d"))
  fill_in('description', :with => dynamic_desc)
end
And /^I choose "(.*?)" as Life Cycle$/ do |s|
  select(s, :from => 'life_cycle_id')
end
And /^I choose "(.*?)" as Cloud Profile and choose "(.*?)" as Location$/ do |provider, location|
  #puts has_select?('div.cloud_profile_select .display')
  #find('div.cloud_profile_select .display', :text => 'cloudstack-he')
  select(provider, :from => 'workload[cloud_profile_name]')
  select(location, :from => 'workload[location_code]')
  #has_select?('workload[location_code]', :selected => location)
end
When /^I click Select Components$/ do
  sleep 1
  click_link 'Select Components'
end
Then /^The page should show the scene of "(.*?)" and selected$/ do |s|
  should have_content s
end
And /^I change the Flavor to the "(.*?)" for first app$/ do |s|
  s =~ /\d+/ # extract the num
  within(:xpath, '//select[@name="servers[flavor][]"]') do
    should have_option?(find('option[#{$~}]'))
    @target_name = find('option[#{$~}]').text
  end
  select(@target_name, :from => 'servers[flavor][]')
  #find(:css, 'select.select-flavor')
end
And /^Leave the Host Key as default$/ do
  # do nothing
end
When /^I click Start Copy$/ do
  click_link 'Start Copy'
end
Then /^I should see the elapsed time transfer-bar upon "(.*?)"$/ do |s|
  have_css(:css, 'div.transfer-bar').should == true #todo
  find(:link, 'copy-wl-topology button').text
end
#And /^I should see "(.*?)"$/
#And /^I should "(.*?)"$/
