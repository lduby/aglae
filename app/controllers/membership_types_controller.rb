class MembershipTypesController < ApplicationController
  load_and_authorize_resource
  
  respond_to :html, :xml, :json
  def index
    @membership_types = @membership_types.accessible_by(current_ability)
    respond_with(@membership_types)
  end

  # PUT /membership_types/1
  # PUT /membership_types/1.json
  def update
    logger.debug("update params sent by grid:")
    logger.debug(params)
    logger.debug("to be updated field: ")
    logger.debug(params[:membership_type][:is_for_local])
    @membership_type = MembershipType.find(params["id"])
=begin
    if !params[:membership_type][:is_for_local].nil?
      if params[:membership_type][:is_for_local] == "checked"
        logger.debug("Updating is_for_local to true")
        @membership_type.is_for_local = 1;
        if @membership_type.save
          @membership_types = MembershipType.all
          respond_with(:status => :ok, :location => @membership_types)
        else
          respond_with(@membership_type.errors, :status => :unprocessable_entity)
        end
      end
    elsif !params[:membership_type][:member_category].nil?
=end

    if !params[:membership_type][:member_category].nil?
      @member_category = MemberCategory.find(params[:membership_type][:member_category])
      @membership_type.member_category = @member_category
      if @membership_type.save
        @membership_types = MembershipType.all
        respond_with(:status => :ok, :location => @membership_types)
      else
        respond_with(@membership_type.errors, :status => :unprocessable_entity)
      end
    else    
      if @membership_type.update_attributes(params[:membership_type])
        @membership_types = MembershipType.all
        respond_with(:status => :ok, :location => @membership_types)
      else
        respond_with(@membership_type.errors, :status => :unprocessable_entity)
      end
    end
  end

  # POST /membership_types
  # POST /membership_types.json
  def create
    @membership_type = MembershipType.new(params[:membership_type])
    if @membership_type.save
      #@membership_types = MembershipType.all
      respond_with({:status => "success"}, :location => "nil")
      #respond_with(@membership_type, :status => :ok, :location => @membership_types) do |format|
      #  format.json { head :ok }
      #end

    else
      respond_with(@membership_types.errors, :status => :unprocessable_entity)
    end
  end


  def new
  	logger.debug(params)
  end

  def toto
  	logger.debug(params)
  end

end