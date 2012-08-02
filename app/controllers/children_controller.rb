class ChildrenController < ApplicationController
  def ajnew
    @child = Child.new
    render :new, :layout => false
  end
  def ajcreate
    @child = Member.new(params[:child])
    if @child.save 
      @msg = "New child added"
    else
      @msg = "Error on saving"
    end
    render :layout => false
  end
  def new 
   @child = Child.new
  end
  def create
    # @child = Child.new(params[:child])
    
    @member = Member.find(params[:member_id])
    @child = @member.children.create(params[:child])
    
    if @child.save
      flash[:notice] = "Successfully created child"
    end
  end
end
