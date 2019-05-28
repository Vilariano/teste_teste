require 'capybara'
require 'capybara/cucumber'
# require 'capybara/dsl'
# require 'capybara/rspec'
# require 'capybara/rspec/matchers'
# require 'capybara/rspec/matcher_proxies'
# require 'httparty'
# require 'httparty/request'
# require 'httparty/response/headers'
# require 'nokogiri'
# require 'open-uri'
require 'rspec'
require 'selenium-webdriver'
require 'site_prism'

require_relative 'helper.rb'
require_relative 'page_helper.rb'

World Capybara::DSL
World Capybara::RSpecMatchers

World Pages
World Helper

BROWSER = ENV['BROWSER']
AMBIENTE = ENV['AMBIENTE']

CONFIG = YAML.load_file(File.dirname(__FILE__) + "/ambientes/#{AMBIENTE}.yml")

## executa driver de acordo com o navegador escolhido
Capybara.register_driver :selenium do |app|
  if BROWSER.eql?('chrome')
    Capybara::Selenium::Driver.new(
      app,
      browser: :chrome,
      desired_capabilities: Selenium::WebDriver::Remote::Capabilities.chrome(
        'chromeOptions' => { 'args' => ['--incognito',
                                        '--disable-cache',
                                        'start-maximized',
                                        '--disable-infobars'] }
      )
    )
  elsif BROWSER.eql?('chrome_headless')
    Capybara::Selenium::Driver.new(
      app,
      browser: :chrome,
      desired_capabilities: Selenium::WebDriver::Remote::Capabilities.chrome(
        'chromeOptions' => { 'args' => ['--incognito',
                                        '--headless',
                                        'disable-gpu',
                                        '--disable-infobars'] }
      )
    )
  end
end

Capybara.configure do |config|
  config.run_server = false
  Capybara.current_driver = :selenium
  # Capybara.default_selector = :css
  config.app_host = CONFIG['url_padrao']
  config.default_max_wait_time = 10
end
