require 'spec_helper_minus_webmock'

describe ScikonController do

  describe "GET 'scikon_profile'" do
    it "returns http success" do
      get 'scikon_profile'
      response.should be_success
    end
  end

end
