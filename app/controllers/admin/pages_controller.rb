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

  def new
    @page = Page.new
  end

  def create
    dir = params[:page].delete :path
    Dir.mkdir(PAGES_URL + dir)
    page_edit(PAGES_URL + dir, params[:page])

    respond_to do |format|
      format.html { redirect_to action: :index }
      format.js { @page = Page.new(params[:page]) }
    end
  end

  def update
    page_edit(PAGES_URL + params[:url], params[:page])

    respond_to do |format|
      format.html { redirect_to action: :index }
      format.js
    end
  end

  def destroy
    @page = params[:url]
    FileUtils.rm_rf(PAGES_URL + @page)
  end

  private
  def page_edit(page_url, params)
    content = params.delete :content
    meta = params.to_yaml
    meta.gsub!("--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n", "")
    File.open(File.join(page_url,PAGES_META), 'w') {|f| f.write(meta)}

    File.open(File.join(page_url,PAGES_INDEX), 'w') {|f| f.write(content) }
  end
end