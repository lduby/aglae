class Registration < ActiveRecord::Base
  has_one :operation, :as => :operationable
end
