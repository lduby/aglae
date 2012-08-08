class Game < ActiveRecord::Base
  has_many :game_copies
  has_many :game_pieces
  attr_accessible :average_length, :category, :description, :manufacturer, :max_nb_player, :min_age, :min_nb_player, :name, :picture, :rule, :supplier
end
