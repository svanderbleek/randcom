require 'spec_helper'
require 'flickr_helper'

describe Commons do
  institution = {'nsid' => '59811348@N05', 'name' => 'Riksarkivet (National Archives of Norway)'}
  photoset = {'id' => '72157627575723598'}
  photo = {'id' => '6105324493'}

  it "gets institutions" do
    subject.institutions.first.should eq(institution)
  end

  it "gets photosets for an institution" do
    subject.photosets(institution).first.should eq(photoset)
  end

  it "gets photos from a photoset" do
    subject.photos(photoset).first.should eq(photo)
  end

  it "gets a random photo from the commons" do
    subject.random.should_not eq(nil)
  end
end
