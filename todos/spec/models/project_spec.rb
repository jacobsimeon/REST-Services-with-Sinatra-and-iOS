require 'helper'

module Todos

  describe Project do

    before do
      @project = Factory.build :project
      @project.save
      @project.add_task Factory.build :task
    end

    it 'requires a name' do
      @project= Factory.build :no_name
      @project.should_not be_valid
      @project.errors.keys.should include(:name)
    end

    it 'serializes to json' do
      jsonified = JSON.parse @project.to_json
      jsonified.should == {'name' => @project.name, 'id' => @project.id }
    end

    it 'has many tasks' do
      @project.tasks.should be_an(Enumerable)
      t = @project.tasks.first
      t.should be_a(Task)
      t.project.should be(@project)
    end

  end
end
