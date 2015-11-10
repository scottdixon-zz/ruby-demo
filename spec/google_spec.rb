require_relative "spec_helper"

describe "Google" do
  it "can load the Google page", :run_on_sauce => true do 
    @driver.manage.timeouts.implicit_wait = 10
    @driver.navigate.to "https://www.google.com"

    raise "Unable to load Google." unless @driver.title.include? "Google"
  end

  it "can perform a search", :run_on_sauce => true do 
    @driver.manage.timeouts.implicit_wait = 10
    @driver.navigate.to "http://www.google.com"
    raise "Unable to load Google." unless @driver.title.include? "Google"

    query = @driver.find_element :name, "q"
    query.send_keys "Sauce Labs"
    query.submit

    wait = Selenium::WebDriver::Wait.new(:timeout => 10)
    wait.until { @driver.title.start_with? "Sauce Labs" }
    raise "Unable to perform a search" unless @driver.title.include? "Sauce Labs"
  end
end
