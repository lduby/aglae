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
		logger.debug('member_categories_select: ')
		logger.debug(@member_categories_select)
		@membership_types = MembershipType.all
		@new_membership_type = MembershipType.new
	end
  
end
