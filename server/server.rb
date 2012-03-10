require 'sinatra'
require 'json'

class TodoServer < Sinatra::Base
  get "/" { "hello world" }
end
