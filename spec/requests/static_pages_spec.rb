require 'spec_helper'

describe "Static Pages Tests: " do

	let(:base_title) { "SubConTraX |" }



  describe "Home Page" do

    it "should have the h1 'SubConTraX'" do
      visit root_path
      page.should have_selector('h1', :text => 'SubConTraX')
    end

    it "should have the right title" do
      visit root_path
      page.should have_selector('title',
                        :text =>  "#{base_title} Home")
    end

  end

  describe "Help Page" do

    it "should have the h1 'SubConTraX Help'" do
      visit help_path
      page.should have_selector('h1', :text => 'SubConTraX Help')
    end

   it "should have the right title" do
      visit help_path
      page.should have_selector('title',
                        :text => "#{base_title} Help")
    end
  end

  describe "About page" do

    it "should have the h1 'SubConTraX About Us'" do
      visit about_path
      page.should have_selector('h1', :text => 'SubConTraX About Us')
    end

   it "should have the right title" do
      visit about_path
      page.should have_selector('title',
                        :text => "#{base_title} About Us")
    end
  end

 describe "Contact Us page" do

    it "should have the h1 'SubConTraX Contact Us'" do
      visit contact_path
      page.should have_selector('h1', :text => 'SubConTraX Contact Us')
    end

   it "should have the right title" do
      visit contact_path
      page.should have_selector('title',
                        :text => "#{base_title} Contact Us")
    end
  end

end