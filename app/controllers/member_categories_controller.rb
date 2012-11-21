class MemberCategoriesController < ApplicationController
  load_and_authorize_resource
  
  respond_to :html, :xml, :json
  def index
    @member_categories = @member_categories.accessible_by(current_ability)
    respond_with(@member_categories)
  end

  def update
    logger.debug("update params sent by grid:")
    logger.debug(params)
    @member_category = MemberCategory.find(params["id"])
    if @member_category.update_attributes(params[:member_category])
      respond_with(:status => :ok)
    else
      respond_with(@member_category.errors, :status => :unprocessable_entity)
    end

  end

  def new
  	logger.debug(params)
  end

  def toto
  	logger.debug(params)
  end

end