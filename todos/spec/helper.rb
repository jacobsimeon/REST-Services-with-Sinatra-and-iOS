require 'bundler/setup'
require 'rack/test'
require 'todos'
require 'todos/models'
require 'todos/server'
require 'factory_girl'
require 'factories.rb'
require 'json'

RSpec.configure do |config|
  config.after :suite do
    Todos.db.run "TRUNCATE TABLE contexts CASCADE"
    Todos.db.run "TRUNCATE TABLE tasks CASCADE"
    Todos.db.run "TRUNCATE TABLE projects CASCADE"
  end
end
  
