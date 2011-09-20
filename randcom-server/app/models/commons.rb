class Commons
  include HTTParty

  base_uri 'http://api.flickr.com'
  
  default_params :api_key => 'ea227068d8ee45d50a3c452ef1b4c1b4',
                 :format => 'json', 
                 :nojsoncallback => 1

  def flickr method, options={}
    Parser.call(self.class.get('/services/rest/', :query => options.merge(:method => "flickr.#{method}")).body, :json)
  end

  def institutions
    @institutions = format_institutions flickr 'commons.getInstitutions'
  end

  def photosets institution
    @photosets = format_photosets (flickr 'photosets.getList', { :user_id => institution['nsid'] })
  end

  def photos photoset
    @photos = format_photos (flickr 'photosets.getPhotos', { :photoset_id => photoset['id'] })
  end

  def random_institution
    @institutions[rand(@institutions.size)] if @institutions
  end

  def random_photoset
    @photosets[rand(@photosets.size)] if @photosets
  end

  def random_photo
    @photos[rand(@photos.size)] if @photos
  end  

  def random
    institutions
    photosets random_institution
    photos random_photoset
    random_photo
  end

  private

  def format_institutions response 
    desired = %w{nsid name}
    response['institutions']['institution'].map do |institution|
      institution['name'] = institution['name']['_content']
      institution.select { |key| desired.include? key }
    end
  end

  def format_photosets response
    desired = %w{id}
    response['photosets']['photoset'].map do |photoset|
      photoset.select { |key| desired.include? key }
    end
  end

  def format_photos response
    desired = %w{id}
    response['photoset']['photo'].map do |photo|
      photo.select { |key| desired.include? key }
    end
  end
end
