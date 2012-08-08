class GameCopyContent < ActiveRecord::Base
  belongs_to :game_piece
  belongs_to :game_copy
  attr_accessible :comment, :condition, :game_copy_id, :game_piece_id, :is_missing
end
