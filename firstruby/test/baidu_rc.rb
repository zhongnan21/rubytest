require "rubygems"
gem "rspec"
gem "selenium-client"
require "selenium/client"
require "selenium/rspec/spec_helper"
require "spec/test/unit"

describe "Untitled" do
  attr_reader :selenium_driver
  alias :page :selenium_driver

  before(:all) do
    @verification_errors = []
    @selenium_driver = Selenium::Client::Driver.new \
      :host => "localhost",
      :port => 4444,
      :browser => "*chrome",
      :url => "http://www.baidu.com/",
      :timeout_in_second => 60
  end

  before(:each) do
    @selenium_driver.start_new_browser_session
  end

  append_after(:each) do
    @selenium_driver.close_current_browser_session
    @verification_errors.should == []
  end

  it "test_untitled" do
    page.open "/"
    page.type "id=kw", "leon"
    page.click "link=o"
    page.wait_for_page_to_load "30000"
    page.click "id=pass_username_tip0"
    page.type "id=pass_loginLite_input_username0", "zhongnan"
    page.type "id=pass_loginLite_input_password0", "password"
    page.click "id=pass_loginLite_input_submit0"
    page.click "link="
    page.select_window "null"
    page.click "id=pass_loginLite_input_submit0"
    page.type "id=pass_loginLite_input_password0", "password"
    page.click "id=pass_loginLite_input_submit0"
    page.click "link=oo"
    page.click "id=su"
    page.wait_for_page_to_load "30000"
  end
end
