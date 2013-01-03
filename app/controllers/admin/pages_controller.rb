class Admin::PagesController < ApplicationController

  def index
    @pages = Dir.glob PAGES_URL+"**/*.html.erb"
    @pages.each do |page|
      page.slice! PAGES_URL
      page.slice! PAGES_INDEX+".html.erb"
    end
    @pages.sort!
  end
  
  def edit
    @page = Page.new(PageParser.parse(params[:slug]) )
    @page.content = File.read(PAGES_URL+ params[:slug]+PAGES_INDEX+".html.erb")
  end

  def update
    content = params[:page].delete :content

    page_yaml = params[:page].to_yaml
    page_yaml.gsub!("--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n", "")
    File.open(PAGES_URL+ params[:slug] + '/meta.yml', 'w') {|f| f.write(page_yaml)}

    File.open(PAGES_URL+ params[:slug] + PAGES_INDEX+".html.erb", 'w') {|f| f.write(content) }
    redirect_to action: :index
  end
end