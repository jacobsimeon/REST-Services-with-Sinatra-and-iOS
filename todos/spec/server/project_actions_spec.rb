require 'helper'

describe Todos::Server do
  include Rack::Test::Methods

  def app
    Todos::Server
  end

  def response_data
    @response_data ||= JSON.parse(last_response.body)
  end

  it 'creates a new project' do
    project_attributes = Factory.attributes_for :project
    post "/projects", project_attributes 
    project = Project.find(project_attributes)
    project.should be_a(Project)
    project.id.should_not be_nil
    response_data.should == project
  end



end
