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
    @membership_type = MembershipType.find(params["id"])
    if !params[:membership_type][:member_category].nil?
      @member_category = MemberCategory.find(params[:membership_type][:member_category])
      @membership_type.member_category = @member_category
      if @membership_type.save
        redirect_to '/preferences/members_management#membership_types', :status => :ok, :notice => "Membership Type updated"
      else
        redirect_to '/preferences/members_management#membership_types', :status => :unprocessable_entity, :notice => @membership_type.errors
      end
    else    
      if @membership_type.update_attributes(params[:membership_type])
        redirect_to '/preferences/members_management#membership_types', :status => :ok, :notice => "Membership Type updated"
      else
        redirect_to '/preferences/members_management#membership_types', :status => :unprocessable_entity, :notice => @membership_type.errors
      end
    end
  end

  # POST /membership_types
  # POST /membership_types.json
  def create
    @membership_type = MembershipType.new(params[:membership_type])
    @member_category = MemberCategory.find(params[:member_category_id])
    @membership_type.member_category = @member_category
    if @membership_type.save
      redirect_to '/preferences/members_management#membership_types', :notice => "Membership Type created"
    else
      redirect_to '/preferences/members_management#membership_types', :notice => @membership_type.errors
    end
  end

  # DELETE /membership_types/1
  # DELETE /membership_types/1.json
  def destroy
    @membership_type = MembershipType.find(params[:id])
    @membership_type.destroy

    respond_to do |format|
      format.html { redirect_to '/preferences/members_management#membership_types', :notice => "Membership Type deleted" }
      format.json { head :no_content }
    end
  end


  def new
    @membership_type = MembershipType.new
  end

  def toto
  	logger.debug(params)
  end

end