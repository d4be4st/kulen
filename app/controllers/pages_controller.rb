class PagesController < ApplicationController

  def pages
    @page = PageParser.parse(params[:url])
    render @page[:page], layout: @page[:layout] + LAYOUTS_INDEX_RENDER 
  end

end