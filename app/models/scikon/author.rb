#   Copyright (c) 2010-2011, Diaspora Inc.  This file is
#   licensed under the Affero General Public License version 3 or later.  See
#   the COPYRIGHT file.

require 'active_model'

# This model is used to store data about authors in our database.
# Some authors may not be registered to diaspora.uni-konstanz.de
# and some may not even belong to the University of Konstanz

class Author
  include ActiveModel::Validations
  
  attr_accessor   :name,
                  :uid
  
  def initialize(params = {})
    self.name = params[:name]
    self.uid = params[:uid]
  end
  
  # This methods provide information whether or not the
  # user exists in the pod (by uid) and returns the user if so
  def is_in_pod?
    false if !has_extern_id?
    User.find_by_popid(self.uid).nil?
  end
  
  # If the author exists in the pod (identified by uid)
  # the user object representation of him is being returned
  def get_pod_user
    User.find_by_popid(self.uid)
  end
  
  # If the author doesn't have a popid, this means he's
  # not part of uni konstanz and can't be in this pod.
  def has_extern_id?
    !self.uid.nil?
  end
  
end