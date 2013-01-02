class PagesController < ApplicationController

  def pages
    page = PageParser.parse(params[:slug])
    # render json: page
    render page[:page], layout: page[:layout]  
  end

end