#   Copyright (c) 2010-2011, Diaspora Inc.  This file is
#   licensed under the Affero General Public License version 3 or later.  See
#   the COPYRIGHT file.

require 'active_model'

# This model is used to store data about authors in our database.
# Some authors may not be registered to diaspora.uni-konstanz.de
# and some may not even belong to the University of Konstanz

class Lecture
  include ActiveModel::Validations
  
  attr_accessor   :id,
                  :title,
                  :number,
                  :type
  
  def initialize(params = {})
    self.id = params[:id]
    self.title = params[:title]
    self.number = params[:number]
    self.type = params[:type]
  end
  
  def link
    ["https://lsf.uni-konstanz.de/qisserver/rds?state=verpublish&status=init&vmfile=no&moduleCall=webInfo&publishConfFile=webInfo&publishSubDir=veranstaltung&veranstaltung.veranstid=", self.id].join("")
  end
  
end