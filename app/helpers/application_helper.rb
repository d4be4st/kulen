module ApplicationHelper

  def layouts
    layouts = Dir.glob LAYOUTS_URL+"**"+LAYOUTS_INDEX
    layouts.each do |page|
      page.slice! LAYOUTS_URL
      page.slice! LAYOUTS_INDEX
    end
    layouts.sort!
  end
end
