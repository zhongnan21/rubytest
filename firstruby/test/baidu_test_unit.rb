require "selenium-webdriver"
require "test/unit"

class Untitled < Test::Unit::TestCase

  def setup
    @driver = Selenium::WebDriver.for :firefox
    @base_url = "http://www.baidu.com/"
    @driver.manage.timeouts.implicit_wait = 30
    @verification_errors = []
  end

  def teardown
    @driver.quit
    assert_equal [], @verification_errors
  end

  def test_untitled
    @driver.get(@base_url + "/")
    @driver.find_element(:id, "kw").clear
    @driver.find_element(:id, "kw").send_keys "leon"
    @driver.find_element(:link, "").click
    @driver.find_element(:id, "pass_username_tip0").click
    @driver.find_element(:id, "pass_loginLite_input_username0").clear
    @driver.find_element(:id, "pass_loginLite_input_username0").send_keys "zhongnan"
    @driver.find_element(:id, "pass_loginLite_input_password0").clear
    @driver.find_element(:id, "pass_loginLite_input_password0").send_keys "password"
    @driver.find_element(:id, "pass_loginLite_input_submit0").click
    @driver.find_element(:link, "").click
    # ERROR: Caught exception [ERROR: Unsupported command [selectWindow]]
    @driver.find_element(:id, "pass_loginLite_input_submit0").click
    @driver.find_element(:id, "pass_loginLite_input_password0").clear
    @driver.find_element(:id, "pass_loginLite_input_password0").send_keys "password"
    @driver.find_element(:id, "pass_loginLite_input_submit0").click
    @driver.find_element(:link, "").click
    @driver.find_element(:id, "su").click
  end

  def element_present?(how, what)
    @driver.find_element(how, what)
    true
  rescue Selenium::WebDriver::Error::NoSuchElementError
    false
  end

  def verify(&blk)
    yield
  rescue Test::Unit::AssertionFailedError => ex
    @verification_errors << ex
  end
end
