require 'fakeweb'

FakeWeb.allow_net_connect = false

base = 'http://api.flickr.com/services/rest/'
institutions = '?api_key=a05db3659e0d2f3e28327489d2dd37e2&format=json&nojsoncallback=1&method=flickr.commons.getInstitutions'

FakeWeb.register_uri :get, (base + institutions), :body => (File.open(File.join(File.dirname(__FILE__), 'fakeweb', 'institutions.json')).read)
