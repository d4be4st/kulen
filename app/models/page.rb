#encoding: UTF-8
class Page
  include ActiveAttr::Model
  
  attribute :content
  attribute :layout
  attribute :page
  attribute :index
  attribute :url
  attribute :path

  attribute :seo_title
  attribute :seo_description
  attribute :seo_keywords

  def page_breadcrumbs
    url.gsub('/',' › ')
  end
end