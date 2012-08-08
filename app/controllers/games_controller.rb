class GamesController < ApplicationController
  def show
    @game = Game.find(params['id'])
  end

  def index
    @games = Game.all
  end

  def create
  end

  def edit
  end

  def new
  end

  def update
  end
  
  def ajnewgame 
    @game = Game.new
    render :layout => false
  end
  
  def ajcreate
    @game = Game.new(params[:game])
    if @game.save 
      @msg = "saved successfully"
    else 
      @msg = "error on saving"  
    end
    render :layout => false
  end 

  def list
    @games=Game.all
    render :layout => false
  end
  
  def jsshow
    @game = Game.find(params['id'])
    render :show, :layout => false
  end
  
  def ajnewgamecopy
    @game = Game.find(params['id'])
    @gamecopy = GameCopy.new
    render :layout => false
  end
  
  
end
