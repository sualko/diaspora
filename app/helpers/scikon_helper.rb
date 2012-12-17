#   Copyright (c) 2010-2011, Diaspora Inc.  This file is
#   licensed under the Affero General Public License version 3 or later.  See
#   the COPYRIGHT file.

require 'savon'
require 'nokogiri'

module ScikonHelper
  def get_sci_profile(params = {})
    client = connect()
    
    #
    response = client.request :getPublicationsByAuthor do
      soap.body = {
        :personId => User.find_by_username(params[:username]).popid,
        :lang => "de",
        :limit => "1000",
        :offset => "0"
      }
    end
    
    if response.success?
      xml = Nokogiri::XML(response.to_xml)
      
      # Saving the publications temporarily and ignoring other data
      publications = xml.xpath("//ax25:publications", 'ax25' => AppConfig.services.scikon.ns_ax25)
      
      return migrate_publications :publications => publications
      
    else
      Rails.logger.error("Could not get a successful response from the server")
    end
  end
  
  # Link_to methods...
  def publication_link(publication)
    link_to(t('scikon.publication.simple_link', :publication => publication.publication_title), publication.urn)
  end
  
  def author_link(author)
    if author.is_in_pod?
      user = User.find_by_popid(author.uid)
      scikon_dia_link = ["scikon/scikon_profile/", user.username].join("")
      link = link_to(author.name, scikon_dia_link)
    elsif  author.has_extern_id?
      scikon_ext_link = ["https://scikon.uni-konstanz.de/personen/", author.qualified_email_prefix].join("")
      link = link_to(author.name, scikon_ext_link)
    else
      link = author.name
    end
    
    link
  end

  private

  # Builds up a connection to the scikon service
  def connect
    client = Savon::Client.new do
    # Einbindung des WSDL Dokuments des anzusprechenden Webservices
      wsdl.document = AppConfig.services.scikon.wsdl
      
    end
    return client
  end
  
  # This method is used to migrate publication objects (and authors aswell)
  # out of the nokogiri xml structure
  def migrate_publications(params = {})
    # Creating a new hash for the authors
    scikon_profile = ScikonProfile.new
    scikon_profile.authors = Hash.new
    scikon_profile.publications = Hash.new
    
    extract_authors params[:publications], scikon_profile.authors
    publications = params[:publications]
    
    publications.each do |publication|
      urn = publication.xpath("ax25:urn", 'ax25' => AppConfig.services.scikon.ns_ax25).text
      
      publication_title = publication.xpath("ax25:title", 'ax25' => AppConfig.services.scikon.ns_ax25).text
      publication_summary = publication.xpath("ax25:summary", 'ax25' => AppConfig.services.scikon.ns_ax25).text
      persistent_link = publication.xpath("ax25:IRLink", 'ax25' => AppConfig.services.scikon.ns_ax25).text
      cite_source = publication.xpath("ax25:citeSource", 'ax25' => AppConfig.services.scikon.ns_ax25).text
      document_type = publication.xpath("ax25:documentType", 'ax25' => AppConfig.services.scikon.ns_ax25).text
      original_link = publication.xpath("ax25:originalLink", 'ax25' => AppConfig.services.scikon.ns_ax25).text
      published_date = publication.xpath("ax25:publishedDate", 'ax25' => AppConfig.services.scikon.ns_ax25).text
      updated_date = publication.xpath("ax25:updatedDate", 'ax25' => AppConfig.services.scikon.ns_ax25).text
      files = publication.xpath("ax25:files", 'ax25' => AppConfig.services.scikon.ns_ax25)
      
      filelinks = Hash.new
      
      files.each do |file|
        filename = file.xpath("ax25:displayFilename", 'ax25' => AppConfig.services.scikon.ns_ax25).text
        filelinks.merge!('#{filename}' => file.xpath("//ax25:link", 'ax25' => AppConfig.services.scikon.ns_ax25).text)
      end
      
      # TODO
      # Do something with projects..
      # Maybe temporarily save the id and on request, check the profile out via scikon
      projects = nil
      
      # TODO
      # Do something with institutions
      # Maybe temporarily save the id and on request, check the profile out via scikon
      institutions = nil
      
      authors = extract_authors publication, nil
      
      p = Publication.new :urn => urn,
                          :publication_title => publication_title,
                          :publication_summary => publication_summary,
                          :persistent_link => persistent_link,
                          :cite_source => cite_source,
                          :document_type => document_type,
                          :institutions => institutions,
                          :original_link => original_link,
                          :projects => projects,
                          :published_date => published_date,
                          :updated_date => updated_date,
                          :files => filelinks,
                          :authors => authors
      
      scikon_profile.publications.merge! urn => p
    end
    
    scikon_profile
  end

  def extract_authors(publication, authors)
    all_authors = publication.xpath("ax25:authors", 'ax25' => AppConfig.services.scikon.ns_ax25)
    
    if authors.nil?
      authors = Hash.new
    end
    
    all_authors.each do |author|
      externId = author.xpath("ax25:externId", 'ax25' => AppConfig.services.scikon.ns_ax25).text
      name = author.xpath("ax25:lastname", 'ax25' => AppConfig.services.scikon.ns_ax25).text
      
      if authors[name].nil?
        a = Author.new :name => name

        if externId != ''
          # TODO
          # Check if author profile is accessible via scikon and create a more detailed profile
          a.uid = externId
        end
      
        authors.merge!(name => a)
      end
    end
    
    authors
  end
  
end
