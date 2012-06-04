require 'spec_helper'


describe "Static Pages Tests: " do

  let(:app_name) { "SubConTraX" }


  subject { page }

  shared_examples_for "all static pages" do
    it { should have_selector('h1', text: heading) }
    it { should have_selector('title', text: full_title(page_title)) }
  end

  describe "Home page without signing in" do
    before { visit root_path }
    let(:heading) { app_name }
    let(:page_title) { 'Welcome' }

    it_should_behave_like "all static pages"
  end

  describe "Home page when signed in" do
    let(:user) { FactoryGirl.create(:user) }
    before { sign_in user }
    before { visit root_path }
    let(:heading) { app_name }
    let(:page_title) { 'Home' }

    it_should_behave_like "all static pages"
  end


  describe "Help page" do
    before { visit help_path }
    let(:heading) { app_name }
    let(:page_title) { 'Help' }

    it_should_behave_like "all static pages"
  end

  describe "About page" do
    before { visit about_path }

    let(:heading) { app_name }
    let(:page_title) { 'About' }

    it_should_behave_like "all static pages"
  end

  describe "Contact page" do
    before { visit contact_path }

    let(:heading) { app_name }
    let(:page_title) { 'Contact' }
  end

  it "should have the right links on the layout" do
    visit root_path
    click_link "About"
    page.should have_selector 'title', text: full_title('About Us')
    click_link "Help"
    page.should have_selector 'title', text: full_title('Help')
    click_link "Contact"
    page.should have_selector 'title', text: full_title('Contact')
    visit root_path
    click_link "Sign up now!"
    page.should have_selector 'title', text: full_title('Sign Up')
  end

end