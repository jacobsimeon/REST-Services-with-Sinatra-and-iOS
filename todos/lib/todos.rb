require "todos/version"

module Todos
  ENV_KEY = 'TODOS_ENV'

  def Todos.config
    path = File.expand_path("../config.yml", __FILE__)
    config = YAML::load File.read(path)
    config[Todos.env]
  end

  def Todos.env
    ENV[ENV_KEY] || 'development'
  end

  def Todos.env= env
    ENV[ENV_KEY] = env
  end

  def Todos.db
    @db
  end

  def Todos.db=(connection)
    @db = connection
  end

end
