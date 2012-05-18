require 'spec_helper'

describe "Static Pages" do

  describe "Home Page" do

    it "should have the h1 'SubConTraX'" do
      visit '/static_pages/home'
      page.should have_selector('h1', :text => 'SubConTraX')
    end

    it "should have the right title" do
      visit '/static_pages/home'
      page.should have_selector('title',
                        :text => "SubConTraX | Home")
    end
  end

  describe "Help Page" do

    it "should have the h1 'SubConTraX Help'" do
      visit '/static_pages/help'
      page.should have_selector('h1', :text => 'SubConTraX Help')
    end

   it "should have the right title" do
      visit '/static_pages/help'
      page.should have_selector('title',
                        :text => "SubConTraX | Help")
    end
  end

  describe "About page" do

    it "should have the h1 'SubConTraX About Us'" do
      visit '/static_pages/about'
      page.should have_selector('h1', :text => 'SubConTraX About Us')
    end

   it "should have the right title" do
      visit '/static_pages/about'
      page.should have_selector('title',
                        :text => "SubConTraX | About Us")
    end
  end


end