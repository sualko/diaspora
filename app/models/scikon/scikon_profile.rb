#   Copyright (c) 2010-2011, Diaspora Inc.  This file is
#   licensed under the Affero General Public License version 3 or later.  See
#   the COPYRIGHT file.

require 'active_model'

# This model holds the information of all scikon data for a given user
# including the publications and so on.
class ScikonProfile
  include ActiveModel::Validations
  
  attr_accessor   :publications,
                  :authors
                  
  def initialize(params = {})
    self.publications = params[:publications]
    self.authors = params[:authors]
  end
  
end