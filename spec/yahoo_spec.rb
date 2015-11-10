require_relative "spec_helper"

describe "Yahoo" do
  it "can load the Yahoo page", :run_on_sauce => true do 
    @driver.manage.timeouts.implicit_wait = 10
    @driver.navigate.to "https://www.yahoo.com"
    
    raise "Unable to load Yahoo." unless @driver.title.include? "Yahoo"
  end

  it "can perform a search", :run_on_sauce => true do 
    @driver.manage.timeouts.implicit_wait = 10
    @driver.navigate.to "http://www.yahoo.com"
    raise "Unable to load Yahoo." unless @driver.title.include? "Yahoo"

    query = @driver.find_element :name, "p"
    query.send_keys "Sauce Labs"
    query.submit

    wait = Selenium::WebDriver::Wait.new(:timeout => 10)
    wait.until { @driver.title.start_with? "Sauce Labs" }
    raise "Unable to perform a search" unless @driver.title.include? "Sauce Labs"
  end
end
