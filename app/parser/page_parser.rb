class PageParser

  def self.parse(slug)
    page = {}
    File.open(PAGES_URL + slug + PAGES_FORMAT).each do |line|
      line = line.strip()
      metadata = /\/\s*(.+):\s*(.+)/.match(line)
      page[metadata[1].to_sym] = metadata[2] if metadata.present?
    end
    page[:page] = slug
    page
  end
  
end