class GameCopyCheck < ActiveRecord::Base
  belongs_to :game_copy
  attr_accessible :comment, :date, :gamecopy_id
end
