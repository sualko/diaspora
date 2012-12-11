#   Copyright (c) 2010-2011, Diaspora Inc.  This file is
#   licensed under the Affero General Public License version 3 or later.  See
#   the COPYRIGHT file.

require 'active_model'

# This model is an abstraction of a publication containing information
# gotten by the scikon service. We don't persist it into the database
# which is why it does not extend ActiveRecord.
class Publication
  include ActiveModel::Validations
  
  attr_accessor   :urn,
                  :publication_title,
                  :publication_summary,
                  :authors,
                  :persistent_link,
                  :cite_source,
                  :document_type,
                  :institutions,
                  :original_link,
                  :projects,
                  :published_date,
                  :updated_date,
                  :files
                  
  def initialize (params = {})
    self.urn = params[:urn]
    self.publication_title = params[:publication_title]
    self.publication_summary = params[:publication_summary]
    self.authors = params[:authors]
    self.persistent_link = params[:persistent_link]
    self.cite_source = params[:cite_source]
    self.document_type = params[:document_type]
    self.institutions = params[:institutions]
    self.original_link = params[:original_link]
    self.projects = params[:projects]
    self.published_date = params[:published_date]
    self.updated_date = params[:updated_date]
  end
                  
end