include ApplicationHelper

def full_title(page_title)
  base_title = "SubConTraX"
  if page_title.empty?
    base_title
  else
    "#{base_title} | #{page_title}"
  end
end

def sign_in(user)
  visit signin_path
  fill_in "Email", with: user.email
  fill_in "Password", with: user.password
  click_button "Sign in"
  # Sign in when not using Capybara as well.
  cookies[:remember_token] = user.remember_token
end


RSpec::Matchers.define :have_the_right_title do |title|
  match do |page|
    page.should have_selector('title', text: title)
  end


end