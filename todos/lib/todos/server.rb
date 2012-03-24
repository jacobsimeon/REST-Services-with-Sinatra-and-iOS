require 'sinatra'
require 'todos/models'
require 'pp'

module Todos
  class Server < Sinatra::Base

    configure do
      enable :raise_errors
      disable :show_exceptions
    end

    before do
      content_type 'application/json', :charset => 'utf8'
      @data = JSON.parse(request.body.read) rescue {}
    end

    #PROJECT ACTIONS
    get '/tasks' do
      Task.to_json
    end

    get '/tasks/:id' do
      @task = Task.find(params)
      raise Sinatra::NotFound unless @task
      @task.to_json
    end

    post '/tasks' do
      pp @data
      @task = Task.new @data 
      if @task.valid?
        @task.save
        @task.to_json
      else
        status 422
        @task.errors_hash.to_json
      end
    end

    put '/tasks/:id' do
      @task = Task.find :id => params[:id]
      raise Sinatra::NotFound unless @task
      @task.update @data
      @task.to_json
    end

    delete '/tasks/:id' do
      @task = Task.find :id => params[:id]
      raise Sinatra::NotFound unless @task
      @task.destroy
      @task.to_json
    end

  end
end
