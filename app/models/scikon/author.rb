#   Copyright (c) 2010-2011, Diaspora Inc.  This file is
#   licensed under the Affero General Public License version 3 or later.  See
#   the COPYRIGHT file.

require 'active_model'

# This model is used to store data about authors in our database.
# Some authors may not be registered to diaspora.uni-konstanz.de
# and some may not even belong to the University of Konstanz

class Author
  include ActiveModel::Validations
  
  attr_accessor   :uid,
                  :name,
                  :email,
                  :phone,
                  :fax,
                  :fn,
                  :sn,
                  :room_id,
                  :room_number,
                  :secretary,
                  :sex,
                  :city,
                  :street,
                  :zip,
                  :wobsite_url,
                  :cv,
                  :interests,
                  :picture,
                  :lectures,
                  :previous_lectures,
                  :assignments,
                  :projects
  
  def initialize(params = {})
    self.uid = params[:uid]
    self.name = params[:name]
    self.email = params[:email]
    self.phone = params[:phone]
    self.fax = params[:fax]
    self.fn = params[:fn]
    self.sn = params[:sn]
    self.room_id = params[:room_id]
    self.room_number = params[:room_number]
    self.secretary = params[:secretary]
    self.sex = params[:sex]
    self.city = params[:city]
    self.street = params[:street]
    self.zip = params[:zip]
    self.wobsite_url = params[:wobsite_url]
    self.cv = params[:cv]
    self.interests = params[:interests]
    self.picture = params[:picture]
    self.lectures = params[:lectures]
    self.previous_lectures = params[:previous_lectures]
    self.assignments = params[:assignments]
    self.projects = params[:projects]
  end
  
  # This methods provide information whether or not the
  # user exists in the pod (by uid) and returns the user if so
  def is_in_pod?
    if !has_extern_id?
      return false
    end
    !User.find_by_popid(self.uid).nil?
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
  
  # Qualified email prefix
  def qualified_email_prefix
    unless email.nil?
      self.email[/[A-Za-z]+([.]{1}[A-Za-z]+)?/]
    end
  end
  
end