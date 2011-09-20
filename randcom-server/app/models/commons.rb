class Commons
  include HTTParty

  base_uri 'http://api.flickr.com'
  
  default_params :api_key => 'a05db3659e0d2f3e28327489d2dd37e2',
                 :format => 'json', 
                 :nojsoncallback => 1

  def flickr method, options={}
    self.class.get('/services/rest/', :query => options.merge(:method => "flickr.#{method}"))
  end

  def institutions
    @institutions = flickr 'commons.getInstitutions'
  end

  def random 
  end
end
