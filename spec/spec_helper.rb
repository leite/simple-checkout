require 'rspec'
require 'factory_bot'

Dir.glob(
  File.join(File.dirname(__FILE__), '..', '{models,services,spec/factories}', '*.rb'),
  &method(:require)
)

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end
