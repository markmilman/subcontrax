include ApplicationHelper

def full_title(page_title)
  base_title = "SubConTraX"
  if page_title.empty?
    base_title
  else
    "#{base_title} | #{page_title}"
  end
end

RSpec::Matchers.define :have_the_right_title do |title|
  match do |page|
    page.should have_selector('title', text: title)
  end

end