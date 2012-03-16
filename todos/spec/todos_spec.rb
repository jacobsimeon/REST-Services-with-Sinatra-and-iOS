require 'helper'
require 'pp'

describe Todos do

  before do
    path = File.expand_path "../../lib/config.yml", __FILE__
    @config_yaml = YAML::load(File.read path)
  end

  it 'gets the configuration' do
    original_env = ENV[Todos::ENV_KEY]
    ENV[Todos::ENV_KEY] = 'test'
    Todos.config.should == @config_yaml['test']
    ENV[Todos::ENV_KEY] = original_env 
  end

  it 'knows the env' do
    original_env = ENV[Todos::ENV_KEY]
    ENV[Todos::ENV_KEY] = "hello"
    Todos.env.should == "hello"
    ENV[Todos::ENV_KEY] = "world"
    Todos.env.should == "world"
    ENV[Todos::ENV_KEY] = original_env
  end

  it 'sets the env' do
    original_env = Todos.env 
    Todos.env = "hello"
    ENV[Todos::ENV_KEY].should == "hello"
    Todos.env = "world"
    ENV[Todos::ENV_KEY].should == "world"
    Todos.env = original_env
  end

end

