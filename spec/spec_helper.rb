ENV["RACK_ENV"] = "test"

require 'database_cleaner'
require 'capybara/rspec'
require './app/lib/link'
require './app/app'
require_relative 'helpers/session'


Capybara.app = BookmarkManager

RSpec.configure do |config|
  config.include SessionHelpers
end


RSpec.configure do |config|

  config.expect_with :rspec do |expectations|

    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end


  config.mock_with :rspec do |mocks|

    mocks.verify_partial_doubles = true
  end


  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end


  config.after(:each) do
    DatabaseCleaner.clean
  end


end
