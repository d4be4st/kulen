# Load the rails application
require File.expand_path('../application', __FILE__)

PAGES_URL = 'app/views/pages/'
PAGES_PATH = 'pages/'
PAGES_FORMAT = '.html.haml'
PAGES_INDEX = '/index'
PAGES_META = '/meta.yml'

# Initialize the rails application
Kulen::Application.initialize!
