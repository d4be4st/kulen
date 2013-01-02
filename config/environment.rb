# Load the rails application
require File.expand_path('../application', __FILE__)

PAGES_URL = 'app/views/pages/'
PAGES_FORMAT = '.html.haml'

# Initialize the rails application
Kulen::Application.initialize!
