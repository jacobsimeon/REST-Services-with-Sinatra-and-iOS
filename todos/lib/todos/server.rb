require 'sinatra'
require 'todos/models'

module Todos
  class Server < Sinatra::Base

    configure do
      enable :raise_errors
      enable :show_exceptions
    end

    post '/projects' do
      @project = Project.create params
      @project.to_json
    end

  end
end
