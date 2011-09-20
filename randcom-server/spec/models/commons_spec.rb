require 'spec_helper'

describe Commons do
  it "gets institutions" do
    subject.institutions['institutions'].should_not eq(nil)
  end
end
