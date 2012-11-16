require 'spec_helper'

describe "Users" do

  subject { page }

  describe "sign up page" do

    let(:submit) { "Create my account" }

    before { visit signup_path }

    it { should have_selector('h1',    text: 'Sign up') }
    it { should have_selector('title', text: full_title('Sign up')) }

    describe "when all fields are blank" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "when all fields are specified and valid" do
      before {
        fill_in "Name", with: "Example User"
        fill_in "Email", with: "a@a.com"
        fill_in "Password", with: "foobar"
        fill_in "Confirmation", with: "foobar"
      }
      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
    end
  end

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }

    before { visit user_path(user) }

    it { should have_selector('h1',    text: user.name) }
    it { should have_selector('title', text: user.name) }
  end

end