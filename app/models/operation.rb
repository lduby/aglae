class Operation < ActiveRecord::Base
  belongs_to :operationable, :polymorphic => true
end
