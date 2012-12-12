require 'spec_helper'

describe ScikonController do

  describe "#scikon_profile" do
    before do
      sign_in alice
    end
    
    it "returns http success" do
      get 'scikon_profile' 
      response.should be_success
    end
  end

end