begin
  require 'rspec';
rescue LoadError;
  require 'spec';
end
require 'cucumber/formatter/unicode'
#$:.unshift(File.dirname(__FILE__) + '/../../lib')

Given /^I have entered (\d+) into the calculator$/ do |n|
  @calculator = Calculator.new
  @calculator.push(n.to_i)
end
And /^I continue entered (\d+) into the calculator$/ do |n|
  @calculator.push(n.to_i)
end
When /^I press add$/ do
  @result = @calculator.add
end
Then /^the result should be (\d+) on the screen$/ do |result|
  @result.should == result.to_i
end
