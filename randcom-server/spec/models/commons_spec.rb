require 'spec_helper'
require 'flickr_helper'

describe Commons do
  it "gets institutions" do
    subject.institutions.should_not eq(nil)
  end
end
