class PagesController < ApplicationController

  def pages
    page = PageParser.parse(params[:slug])
    # render json: page
    @title = page[:title]
    render page[:page_url], layout: page[:layout]  
  end

end