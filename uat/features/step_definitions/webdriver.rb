require "selenium-webdriver"

driver = Selenium::WebDriver.for :htmlunit
driver.navigate.to "http://google.com"

element = driver.find_element(:name, 'q')
element.send_keys "Hello WebDriver!"
element.submit

puts driver.title
driver.navigate.to "http://www.baidu.com"

driver.quit