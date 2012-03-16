require 'sequel'
Todos.db = Sequel.connect Todos.config
require 'todos/models/project.rb'
require 'todos/models/task.rb'
require 'todos/models/context.rb'

