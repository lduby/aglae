class MembersController < ApplicationController
  def index
    @members = Member.all
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
    else 
      @msg = "error on saving"  
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
    @members=Member.all
    render :layout => false
  end
  
  def ajnewchild
    @member = Member.find(params['id'])
    @child = Child.new
    render :layout => false
  end
  
end
