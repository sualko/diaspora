require 'spec_helper'

describe ScikonController do

  describe "GET 'scikon_profile'" do
    it "returns http success" do
      get 'scikon_profile'
      response.should be_success
    end
  end

end
