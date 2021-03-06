class MembersController < ApplicationController
  load_and_authorize_resource
  
  respond_to :html, :xml, :json
  def index
    @members = @members.accessible_by(current_ability)
    @all_members = Member.all
    @board_members = Array.new
    @all_members.each do |m|
      if m.is_a_board_member
        @board_members << m
      end
    end
    @volunteers = Array.new
    @all_members.each do |v|
      if v.is_a_volunteer
        @volunteers << v
      end
    end


    #respond_with(@members)
    respond_with({ :members => @members, :all_members => @all_members, :board_members => @board_members, :volunteers => @volunteers})
#    respond_to do |format|
#      format.html
#      format.json { 
#        logger.debug("JSON members")
#        logger.debug(@members.size)
#        render :json => @members }
#    end

    
  end
  
  def show
    @member = Member.find(params['id'])
  end
  
  def show_profile
    @member = Member.find(params['id'])
  end
  
  def create
    @member = Member.new(params[:member])
    @member_category = MemberCategory.find(params[:member_category_id])
    @member.member_category = @member_category
    if @member.save 
      flash[:notice] = "Successfully created member"
    end
  end
  
  def ajcreate
    @member = Member.new(params[:member])
    @member_category = MemberCategory.find(params[:member_category_id])
    @member.member_category = @member_category
    if @member.save 
      @msg = "saved successfully"
      if params["email"] != ""
        create_user_account(params["email"])
      end
      flash[:notice] = "Member was created successfully."
      respond_with(@member)
    else 
      @msg = "error on saving member"  
      respond_with(@member.errors, :status => :unprocessable_entity)
    end
    #render :layout => false
  end 

  def ajnewmember_children
    @member = Member.find(params['id'])
    @child = Child.new
  end

  def jsshow
    @member = Member.find(params['id'])
    render :show, :layout => false
  end

  def summary
    @member = Member.find(params['id'])
    render :layout => false
  end
  
  def edit
    @member = Member.find(params['id'])
  end

  def new
    @member = Member.new
  end

  def update
  end
  
  def ajnewmember
    @member = Member.new
    render :layout => false
  end
  
  def search
    @searchlist=Array.new
    Member.all.each do |member|
      @searchlist << member.lastname + " " + member.firstname
    end
    Game.all.each do |game|
      @searchlist << game.name
    end
    logger.debug @searchlist
    render :json => @searchlist
  end
  
  def list
    #@members=Member.all
    @members = @members.accessible_by(current_ability)
    render :layout => false
  end
  
  def ajnewchild
    @member = Member.find(params['id'])
    @child = Child.new
    render :layout => false
  end

  def create_user_account(email)
=begin
    @user = User.new(:email => params["email"])
    if @user.save
      @user.member_profile = @member
      @msg << " and corresponding user successfullty created"
    else
      @msg << " but corresponding user not created"
    end
=end

  end
  
end
