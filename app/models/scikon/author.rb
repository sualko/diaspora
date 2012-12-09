#   Copyright (c) 2010-2011, Diaspora Inc.  This file is
#   licensed under the Affero General Public License version 3 or later.  See
#   the COPYRIGHT file.

require 'active_model'

# This model is used to store data about authors in our database.
# Some authors may not be registered to diaspora.uni-konstanz.de
# and some may not even belong to the University of Konstanz

class Author
  include ActiveModel::Validations
  
  attr_accessor   :fn,
                  :sn,
                  :uid,
                  :mail
  
  def initialize(params = {})
    self.fn = params[:fn]
    self.sn = params[:sn]
    self.uid = params[:uid]
    self.mail = params[:mail]
  end
  
  # This methods provide information whether or not the
  # user exists in the pod (by uid)
  def is_in_pod?
    false if !has_extern_id?
  end
  
  # If the author exists in the pod (identified by uid)
  # the user object representation of him is being returned
  def get_pod_user
    nil if !is_in_pod?
  end
  
  # If the author doesn't have a popid, this means he's
  # not part of uni konstanz and can't be in this pod.
  def has_extern_id?
    return false
  end
  
end