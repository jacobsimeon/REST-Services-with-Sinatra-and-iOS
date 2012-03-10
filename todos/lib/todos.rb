require "todos/version"
require 'sinatra'
module Todos
  class Server < Sinatra::Base
    get "/" do
      "hello world"
    end
  end
end
