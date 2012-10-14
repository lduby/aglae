class MembersController < ApplicationController
  load_and_authorize_resource
  def index
    @members = @members.accessible_by(current_ability)
    logger.debug(@members)
  end
  
  def show
    @member = Member.find(params['id'])
  end
  
  def show_profile
    @member = Member.find(params['id'])
  end
  
  def create
    @member = Member.new(params[:member])
    if @member.save 
      flash[:notice] = "Successfully created member"
    end
  end
  
  def ajcreate
    @member = Member.new(params[:member])
    if @member.save 
      @msg = "saved successfully"
      if params["email"] != ""
        @user = User.new(:email => params["email"])
        if @user.save
          @user.member_profile = @member
          @msg << " and corresponding user successfullty created"
        else
          @msg << " but corresponding user not created"
        end
      end
    else 
      @msg = "error on saving member"  
    end
    render :layout => false
  end 

  def jsshow
    @member = Member.find(params['id'])
    render :show, :layout => false
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
  
end
