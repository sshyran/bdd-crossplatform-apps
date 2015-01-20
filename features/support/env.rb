require 'open3'
require 'thread'
require 'httparty'
require 'appium_lib'
require_relative 'mock_backend/mock_backend'
require_relative '../step_definitions/screen_factory'

class CustomWorld

  def initialize screenFactory
    @screenFactory = screenFactory
  end

  def launch_to_screen screen
    $driver.start_driver
    screen.wait_for_load
    screen
  end

  def launch_to_commit_list_screen
    launch_to_screen @screenFactory.get_commit_list_screen()
  end

end

World do
  CustomWorld.new(ScreenFactory.new(ENV['PLATFORM']))
end

GitHubMockBackend::Boot.boot

# We can bind Appium to localhost because only the machine
# running the tests needs access to it
APPIUM_SERVER_URL = "http://localhost:4723"

puts "Appium server URL: #{APPIUM_SERVER_URL}"

# Boot up Appium here
# node node_modules/appium/bin/appium -a HOST

# Appium
caps = Appium.load_appium_txt file: 'appium.txt', verbose: true
Appium::Driver.new({:caps => caps, :custom_url => APPIUM_SERVER_URL})
Appium.promote_appium_methods CustomWorld
