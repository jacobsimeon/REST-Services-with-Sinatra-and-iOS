require 'sinatra'
require 'todos/models'

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
    get '/projects' do
      Project.to_json
    end

    get '/projects/:id' do
      @project = Project.find(params)
      raise NotFound unless @project
      @project.to_json
    end

    post '/projects' do
      @project = Project.new @data 
      if @project.valid?
        @project.save
        @project.to_json
      else
        @project.errors_hash.to_json
      end
    end

    put '/projects/:id' do
      @project = Project.find params
      raise NotFound unless @project
      @project.update @data
    end

    delete '/projects/:id' do
      @project = Project.find params 
      raise NotFound unless @project
      @project.destroy
    end

    #TASK ACTIONS
    get '/project/:id/tasks' do
      @project = Project.find params
      raise NotFound unless @project
      @project.tasks.to_json
    end

    get '/project/:project_id/task/:id' do
      @task = Task.find params
      raise NotFound unless @task
      @task.to_json
    end

    post 'projects/:id/tasks' do
      @project = Project.find params
      raise NotFound unless @project
      @task = Task.new(@data)
      if @task.valid?
        @task.save
        @task.to_json
      else
        @task.errors_hash.to_json
      end
    end

    put '/projects/:project_id/tasks/:id' do
      @task = Task.find params      
      raise NotFound unless @task
      @task.update @data
      @task.to_json
    end

    delete '/projects/:project_id/tasks/:id' do
      @task = Task.find params 
      raise NotFound unless @task
      @task.destroy
    end

    #CONTEXT ACTIONS
    get '/contexts' do
      Context.to_json
    end

    get '/contexts/:id' do
      @context = Context.find params
      raise NotFound unless @context
      @context.to_json
    end

    post '/contexts' do
      @context = Context.new @data
      if @context.valid?
        @context.save
        @context.to_json
      else
        @context.errors_hash.to_json
      end
    end

    put '/contexts/:id' do
      @context = Context.find params
      raise NotFound unless @context
      @context.update @data
      @context.to_json
    end

    delete '/contexts/:id' do
      @context = Context.find params
      raise NotFound unless @context
      @context.destroy
    end

    #CONTEXT-TASK ACTIONS
    put '/contexts/:context_id/tasks/:id' do
      set_context_and_task
      @context.add_task @task
    end

    delete '/contexts/:context_id/tasks/:id' do
      set_context_and_task
      @context.remove_task @task 
    end

    def set_context_and_task
      @context = Context.find :id => params.delete(:context_id)
      @task = Task.find params
      raise NotFound unless (@task and @context)
    end

  end
end
