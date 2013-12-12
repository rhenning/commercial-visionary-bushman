require "spec_helper"
require_relative "../libraries/helper_module.rb"
require_relative "../libraries/helper_class.rb"

describe "commercial-visionary-bushman::default" do
  let :chef_run do
    ChefSpec::ChefRunner.new(log_level: :info)
  end

  it "should stub helper module methods included in a recipe with any_instance" do
    Chef::Recipe.any_instance.stub(:log_message).and_return "stubbed log message"
    chef_run.converge(described_recipe)
    expect(chef_run).to log "stubbed log message"
  end

  it "should stub helper class instance methods with any_instance" do
    HelperClass.any_instance.stub(:log_message).and_return "stubbed log message"
    chef_run.converge(described_recipe)
    expect(chef_run).to log "stubbed log message"
  end

  it "should stub helper class instance methods with double" do
    klass = double("helper class", log_message: "stubbed log message")
    HelperClass.stub(:new).and_return klass
    chef_run.converge(described_recipe)
    expect(chef_run).to log "stubbed log message"
  end
end
