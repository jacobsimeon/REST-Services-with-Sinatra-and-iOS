require 'helper'

describe Context do
  it 'has many tasks' do
    @context = Factory.build :context
    @context.save
    task = Factory.build :task
    @context.add_task task
    @context.tasks.first.id.should == task.id
    @context.save
    task.contexts.first.id.should == @context.id  
  end
end
