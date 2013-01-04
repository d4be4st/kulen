# Load the rails application
require File.expand_path('../application', __FILE__)

PAGES_URL = 'app/views/pages/'
PAGES_PATH = 'pages/'
PAGES_FORMAT = '.html.erb'
PAGES_INDEX_RENDER = '/index'
PAGES_INDEX = '/index.html.erb'
PAGES_META = '/meta.yml'

LAYOUTS_URL = 'app/views/layouts/'
LAYOUTS_INDEX = '/layout.html.erb'
LAYOUTS_INDEX_RENDER = '/layout'

# Initialize the rails application
Kulen::Application.initialize!
