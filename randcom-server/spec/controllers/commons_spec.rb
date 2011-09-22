require 'spec_helper'

describe CommonsController do
  it "should only respond to json" do
    get :random, :format => :xml
    response.code.should eq('406')

    get :random, :format => :html
    response.code.should eq('406')

    get :institutions, :format => :xml
    response.code.should eq('406')
    
    get :institutions, :format => :html
    response.code.should eq('406')
  end

  it "should provide the random photo service" do
    get :random, :format => :json
    response.code.should eq('200')
  end

  it "should allow for filtering by institution with the random photo service" do
    get :random, :format => :json #, {:exclude => '59811348@N05'}
    response.code.should eq('200')
  end

  it "should provide the institutions list service" do
    get :institutions, :format => :json
    response.code.should eq('200')
  end
end
