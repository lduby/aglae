class PreferencesController < ApplicationController

  def members_management
  	@member_categories = MemberCategory.all
  	@member_categories_select = Array.new
  	@member_categories.each do |mcat|
  	  @cat = Array.new
  	  @cat << mcat.id
  	  @cat << mcat.title
  	  @member_categories_select << @cat
  	end
  	@membership_types = MembershipType.all
  	@new_membership_type = MembershipType.new
    @new_member_category = MemberCategory.new
  end

  def toy_library

  end

  def update_location
  	if !params[:name].nil? && params[:name] != Aglae::Application.config.toy_library_name
  		logger.debug("Updating toy library name by "+params[:name])
  		Aglae::Application.config.toy_library_name = params[:name]
  	end
  	if !params[:address].nil? && params[:address] != Aglae::Application.config.toy_library_address
  		logger.debug("Updating toy library address by "+params[:address])
  		Aglae::Application.config.toy_library_address = params[:address]
  	end
  	if !params[:city].nil? && params[:city] != Aglae::Application.config.toy_library_city
  		logger.debug("Updating toy library city by "+params[:city])
  		Aglae::Application.config.toy_library_city = params[:city]
  	end
  	if !params[:zipcode].nil? && params[:zipcode] != Aglae::Application.config.toy_library_zipcode
  		logger.debug("Updating toy library zipcode by "+params[:zipcode])
  		Aglae::Application.config.toy_library_zipcode = params[:zipcode]
  	end
  	if !params[:phone].nil? && params[:phone] != Aglae::Application.config.toy_library_phone
  		logger.debug("Updating toy library phone by "+params[:phone])
  		Aglae::Application.config.toy_library_phone = params[:phone]
  	end
  	if !params[:email].nil? && params[:email] != Aglae::Application.config.toy_library_contact_email
  		logger.debug("Updating toy library email by "+params[:email])
  		Aglae::Application.config.toy_library_contact_email = params[:email]
  	end
  	redirect_to '/preferences/toy_library?tab=location', :notice => "Data saved"
  end
  
end
