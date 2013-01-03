class PageParser

  def self.parse(slug)
    page = YAML.load_file(PAGES_URL + slug + PAGES_META)
    page = page.symbolize_keys
    page[:page] = slug
    page[:page_url] = PAGES_PATH + slug + PAGES_INDEX 

    page
  end
  
end