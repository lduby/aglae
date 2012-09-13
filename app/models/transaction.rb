class Transaction < ActiveRecord::Base
  has_many :records
end
