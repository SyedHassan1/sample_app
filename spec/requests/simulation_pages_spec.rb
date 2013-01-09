require 'spec_helper'

describe "Simulation pages" do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  describe "simulation creation" do
    before { visit root_path }

    describe "with invalid information" do

      it "should not create a simulation" do
        expect { click_button "Save" }.not_to change(Simulation, :count)
      end

      describe "error messages" do
        before { click_button "Save" }
        it { should have_content('error') } 
      end
    end

    describe "with valid information" do

      before { fill_in 'simulation_input', with: "Lorem ipsum" }
      it "should create a simulation" do
        expect { click_button "Save" }.to change(Simulation, :count).by(1)
      end
    end
  end
  describe "simulation destruction" do
    before { FactoryGirl.create(:simulation, user: user) }

    describe "as correct user" do
      before { visit user_path(user) }

      it "should delete a simulation" do
        expect { click_link "delete" }.to change(Simulation, :count).by(-1)
      end
    end
  end
end
