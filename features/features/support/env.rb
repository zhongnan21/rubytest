begin
  require 'rspec/expectations';
  require 'rspec/expectations/errors';
rescue LoadError;
  require 'spec/expectations';
end
require_relative '../../features/exceptions/object_not_found_exception'
require_relative '../step_definitions/PortalActions'

require "rubygems"
require 'capybara'
require 'capybara/dsl'
require 'capybara/cucumber'
#require 'launchy' # used for debug save_and_open_page
require 'capybara/selenium/driver'
#World(Capybara)

PORTAL_URL = 'https://ateam.appcara.biz'
WL_URL = 'https://ateam.appcara.biz/workloads/new'
WORKLOADS = 'https://ateam.appcara.biz/workloads'
UID = 'uat.user.1@appcara.com'
PWD = 'changeme'
SELENIUM_STAND_ALONE_SERVER = "http://localhost:4444/wd/hub"

###############################################################################
# Pure firefox driver, which test in browser and quite slow
###############################################################################
#driver = Selenium::WebDriver.for :firefox

###############################################################################
# HTMLUnit driver which quite faster, partially support javascript, default the js is disabled
###############################################################################
#@caps = Selenium::WebDriver::Remote::Capabilities.htmlunit(:javascript_enabled => true, :css_selectors_enabled=>true)
#driver = Selenium::WebDriver.for :remote, :url => SELENIUM_STAND_ALONE_SERVER, :desired_capabilities => @caps

def desiredBrowser
  #:htmlunit
  #:chrome
  :firefox
  #@caps
end

###############################################################################
# Remote server testing with java -jar selenium-server-standalone-2.25.0.jar
###############################################################################
driver = Selenium::WebDriver.for(:remote, :url => SELENIUM_STAND_ALONE_SERVER, :desired_capabilities => desiredBrowser)

driver.manage.timeouts.implicit_wait = 30
Capybara.run_server = false
Capybara.default_driver = :selenium
Capybara.register_driver :selenium do |app|
  # easily switch btw different browsers including headless
  Capybara::Selenium::Driver.new(app, :browser => :remote, :url => SELENIUM_STAND_ALONE_SERVER, :desired_capabilities => desiredBrowser)
end
#Capybara.current_driver = :selenium
Capybara.default_wait_time=20

Before do
  # initialise before each scenario
  @driver = driver
end

Before('@admin') do
  login_to_portal
end

After do |scenario|
  if(scenario.failed?) # passed?
    subject = "[Cucumber scenario failure:] #{scenario.exception.message}"
    puts subject
    page.driver.browser.save_screenshot("#{scenario.__id__}.png")
    embed("#{scenario.__id__}.png", "image/png", "SCREENSHOT")
    #send_failure_email(subject)
    #Cucumber.wants_to_quit = true if s.failed?
  end
end

at_exit do
  driver.quit
end

