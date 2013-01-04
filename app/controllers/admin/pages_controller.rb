class Admin::PagesController < ApplicationController

  layout 'admin/layouts/admin'

  def index
    @pages = Dir.glob PAGES_URL+"**"+PAGES_INDEX
    @pages.each do |page|
      page.slice! PAGES_URL
      page.slice! PAGES_INDEX
    end
    @pages.sort!
  end
  
  def edit
    @page = Page.new(PageParser.parse(params[:url]) )
    @page.content = File.read(PAGES_URL+ params[:url]+PAGES_INDEX)
  end

  def update
    content = params[:page].delete :content

    page_yaml = params[:page].to_yaml
    page_yaml.gsub!("--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n", "")
    File.open(PAGES_URL+ params[:url] + PAGES_META, 'w') {|f| f.write(page_yaml)}

    File.open(PAGES_URL+ params[:url] + PAGES_INDEX, 'w') {|f| f.write(content) }
    redirect_to action: :index
  end

  def content
    @parent = params[:dir]
    @dir = JqueryFileTree.new(@parent).dirs
    render layout: false
  end
end