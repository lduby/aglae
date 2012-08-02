class GamePiece < ActiveRecord::Base
  belongs_to :game
  attr_accessible :game_id, :label, :order
end
