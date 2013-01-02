class Admin::PagesController < ApplicationController

  def index
    @pages = Dir.entries(PAGES_URL)
    @pages.delete('.')
    @pages.delete('..')
    @pages.map! { |p| p.split('.')[0]}
    @pages.sort!
  end
  
  def edit
    @page = PageParser.parse(params[:slug]) 
  end
end