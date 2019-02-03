class Post < ApplicationRecord
  belongs_to :user
  validates :text, length:{maximum:100},presence: true
  validates :title, length:{maximum:20},presence: true
end
