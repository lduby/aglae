class GameCopy < ActiveRecord::Base
  belongs_to :game
  has_many :game_copy_checks
  has_many :borrowings
  attr_accessible :PurchasePrice, :RentPrice, :comment, :condition, :game_id, :location, :purchase_date, :status
end
