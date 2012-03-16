require 'helper'

module Todos
  describe 'Project relationships' do
    before do
      @project = Factory.build :project
      @project.save
      @project.add_task Factory.build :task
    end

    it 'should have many tasks' do
      @project.tasks.should be_an(Enumerable)
      t = @project.tasks.first
      t.should be_a(Task)
      t.project.should be(@project)
    end

    it 'should serialize to json' do
      jsonified = JSON.parse(@project.to_json)
      jsonified.should == JSON.parse({ :json_class => 'Project', :name => @project.name, :id => @project.id }.to_json)
    end

  end
end
