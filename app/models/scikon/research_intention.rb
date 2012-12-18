#   Copyright (c) 2010-2011, Diaspora Inc.  This file is
#   licensed under the Affero General Public License version 3 or later.  See
#   the COPYRIGHT file.

require 'active_model'

# This model is used to store data about authors in our database.
# Some authors may not be registered to diaspora.uni-konstanz.de
# and some may not even belong to the University of Konstanz

class ResearchIntention
  include ActiveModel::Validations
  
  attr_accessor   :id,
                  :title,
                  :role,
                  :start,
                  :end
  
  def initialize(params = {})
    self.id = params[:id]
    self.title = params[:title]
    self.role = params[:role]
    self.start = params[:start]
    self.end = params[:end]
  end
  
  def link
    "https://scikon.uni-konstanz.de/forschungsvorhaben/#{self.id}"
  end
  
  
end