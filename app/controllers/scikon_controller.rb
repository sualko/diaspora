#   Copyright (c) 2010-2011, Diaspora Inc.  This file is
#   licensed under the Affero General Public License version 3 or later.  See
#   the COPYRIGHT file.

class ScikonController < ApplicationController
  include ScikonHelper

  before_filter :authenticate_user!

  def scikon_profile
    if !params[:forename].nil?
        @user = User.find_by_username([params[:forename], params[:lastname]].join("."))
    else
        @user = current_user
    end
    
    Rails.cache.fetch("scikon_profile_for_#{@user.popid}", :expires_in => 12.hours) do
      get_person_profile @user.popid
    end
    
    @scikon_profile = Rails.cache.fetch("scikon_profile_for_#{@user.popid}")
    @person = @user.person
    
    unless params[:format] == "json" # hovercard
      if current_user
        @block = current_user.blocks.where(:person_id => @person.id).first
        @contact = current_user.contact_for(@person)
        @aspects_with_person = []
        if @contact && !params[:only_posts]
          @aspects_with_person = @contact.aspects
          @aspect_ids = @aspects_with_person.map(&:id)
          @contacts_of_contact_count = @contact.contacts.count
          @contacts_of_contact = @contact.contacts.limit(8)

        else
          @contact ||= Contact.new
          @contacts_of_contact_count = 0
          @contacts_of_contact = []
        end
      end
    end
  end
  
  def publication_list
    if !params[:forename].nil?
        @user = User.find_by_username([params[:forename], params[:lastname]].join("."))
    else
        @user = current_user
    end
    
    Rails.cache.fetch("scikon_publications_for_#{@user.username}", :expires_in => 12.hours) do
      get_sci_profile :username => @user.username
    end
    
    @scikon_profile = Rails.cache.fetch("scikon_publications_for_#{@user.username}")
    @person = @user.person
    
    unless params[:format] == "json" # hovercard
      if current_user
        @block = current_user.blocks.where(:person_id => @person.id).first
        @contact = current_user.contact_for(@person)
        @aspects_with_person = []
        if @contact && !params[:only_posts]
          @aspects_with_person = @contact.aspects
          @aspect_ids = @aspects_with_person.map(&:id)
          @contacts_of_contact_count = @contact.contacts.count
          @contacts_of_contact = @contact.contacts.limit(8)

        else
          @contact ||= Contact.new
          @contacts_of_contact_count = 0
          @contacts_of_contact = []
        end
      end
    end
  end
end
