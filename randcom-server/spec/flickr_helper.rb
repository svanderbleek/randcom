require 'fakeweb'

base = 'http://api.flickr.com/services/rest/?api_key=ea227068d8ee45d50a3c452ef1b4c1b4&format=json&nojsoncallback=1&'

institutions = 'method=flickr.commons.getInstitutions'
photosets = 'user_id=59811348%40N05&method=flickr.photosets.getList'
photos = 'photoset_id=72157627575723598&method=flickr.photosets.getPhotos'

fakeweb = File.join(File.dirname(__FILE__), 'fakeweb') 
FakeWeb.register_uri :get, (base + institutions), :body => (File.open(File.join(fakeweb, 'institutions.json')).read)
FakeWeb.register_uri :get, (base + photosets), :body => (File.open(File.join(fakeweb, 'photosets.json')).read)
FakeWeb.register_uri :get, (base + photos), :body => (File.open(File.join(fakeweb, 'photos.json')).read)
