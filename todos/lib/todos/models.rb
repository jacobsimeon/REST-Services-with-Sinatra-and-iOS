require 'sequel'
Todos.db = Sequel.connect Todos.config

class Sequel::Model
  plugin :validation_helpers
  plugin :json_serializer, :naked => true

  def errors_hash
    { :errors => errors.full_messages }
  end
end

require 'todos/models/project.rb'
require 'todos/models/task.rb'
require 'todos/models/context.rb'
