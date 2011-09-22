require 'active_support/core_ext/array/random_access'

class Commons
  include HTTParty

  base_uri 'http://api.flickr.com'
  
  default_params :api_key => 'ea227068d8ee45d50a3c452ef1b4c1b4',
                 :format => 'json', 
                 :nojsoncallback => 1

  def flickr method, options={}
    response = self.class.get('/services/rest/', :query => options.merge(:method => "flickr.#{method}")).body
    Parser.call(response, :json)
  end

  def institutions options={}
    institutions = format_institutions flickr 'commons.getInstitutions'
    options[:exclude] ? (exclude_institutions institutions, options[:exclude]) : institutions
  end

  def photosets institution
    format_photosets (flickr 'photosets.getList', { :user_id => institution['nsid'] })
  end

  def photos photoset
    format_photos (flickr 'photosets.getPhotos', { :photoset_id => photoset['id'] })
  end

  def random_photo options={} 
    photo = (photos (photosets (institutions options).sample).sample).sample
    {'photo_url' => "http://farm#{photo['farm']}.static.flickr.com/#{photo['server']}/#{photo['id']}_#{photo['secret']}.jpg"}
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
    desired = %w{farm server id secret}
    response['photoset']['photo'].map do |photo|
      photo.select { |key| desired.include? key }
    end
  end

  def exclude_institutions insitutions, excludes
    excludes = excludes.split ','
    institutions.reject {|institution| excludes.include? institution['ns_id']}
  end
end
