class PageParser

  def self.parse(url)
    page = YAML.load_file(PAGES_URL + url + PAGES_META)
    page = page.symbolize_keys
    page[:page] = PAGES_PATH + url + PAGES_INDEX_RENDER
    page[:index] = PAGES_PATH + url + PAGES_INDEX
    page[:url] = url

    page
  end
  
end