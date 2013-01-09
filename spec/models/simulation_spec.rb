require 'spec_helper'

describe Simulation do

  let(:user) { FactoryGirl.create(:user) }
  before do
    @simulation = user.simulations.build(input: "Lorem ipsum", output: "Output")
  end

  subject { @simulation }

  it { should respond_to(:input) }
  it { should respond_to(:output) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should == user}

  it { should be_valid }

  describe "when user_id is not present" do
    before { @simulation.user_id = nil }
    it { should_not be_valid }
  end

  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        Simulation.new(user_id: user.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end    
  end
  
  describe "when user_id is not present" do
    before { @simulation.user_id = nil }
    it { should_not be_valid }
  end

  describe "with blank content" do
    before { @simulation.input = " " }
    it { should_not be_valid }
  end

  describe "with content that is too long" do
    before { @simulation.input = "a" * 141 }
    it { should_not be_valid }
  end
end
