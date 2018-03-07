class Todo < ApplicationRecord

  has_many :users, through: :todo_lists
  has_many :todo_lists
end
