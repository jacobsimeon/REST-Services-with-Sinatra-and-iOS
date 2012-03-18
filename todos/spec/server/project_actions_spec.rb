require 'helper'

describe Todos::Server do
  include Rack::Test::Methods

  def app
    Todos::Server
  end

  def response_data
    @response_data ||= JSON.parse(last_response.body)
  end

  describe 'post /projects' do

    it 'creates a new project' do
      project_attributes = Factory.attributes_for :project
      post "/projects", project_attributes.to_json
      project = Project.find(project_attributes)
      project.should be_a(Project)
      response_data['id'].should == project.id
    end

    it 'validates the project' do
      attributes = Factory.attributes_for :no_name
      post '/projects'
      Project.find(attributes).should be_nil
      response_data.should == {'errors' => ["name is not present"]}
    end

  end


  it 'updates a project' do
    @project = Factory.build :project
    @project.save
    @project.name = "this is an awesome project"
    json = @project.to_json(:exclude => :json_class)
    put "/projects/#{@project.id}", json
    updated_project = Project.find(:id => @project.id)
    updated_project.name.should == "this is an awesome project"
  end

  it 'deletes a project' do
    @project = Factory.build :project
    @project.save
    @project.add_task Task.new :name => "task #1"
    delete "/projects/#{@project.id}"
    @project = Project.find :id => @project.id
    @project.should be_nil
  end

end
