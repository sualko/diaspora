#   Copyright (c) 2010-2011, Diaspora Inc.  This file is
#   licensed under the Affero General Public License version 3 or later.  See
#   the COPYRIGHT file.

class ScikonController < ApplicationController
  include ScikonHelper

  before_filter :authenticate_user!

  def scikon_profile(params = {})
    if params[:username]
        @user = User.find_by_username(params[:username])
        @scikon_profile = get_sci_profile(params[:username])
    else
        @user = current_user
        @scikon_profile = get_sci_profile(@user.username)
    end
    
    @person = @user.person
    
    unless @person.nil?
      @contact = current_user.contact_for(@person)
    end
  end
end
