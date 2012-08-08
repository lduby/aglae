class GameCopiesController < ApplicationController
  def ajnew
    @gamecopy = GameCopy.new
    render :new, :layout => false
  end
  def ajcreate
    @gamecopy = Game.new(params[:gamecopy])
    if @gamecopy.save 
      @msg = "New game copy added"
    else
      @msg = "Error on saving"
    end
    render :layout => false
  end
  def new 
   @gamecopy = GameCopy.new
  end
  def create
    
    @game = Game.find(params[:game_id])
    @gamecopy = @game.game_copies.create(params[:gamecopy])
    
    if @gamecopy.save
      flash[:notice] = "Successfully created copy"
    end
  end
end
