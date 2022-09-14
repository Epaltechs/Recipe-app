class Recipe < ApplicationRecord
  #Association
  belongs_to :user, counter_cache: true, foreign_key: 'user_id'

  #Validations

  validates_presence_of :name, :preparation_time, :cooking_time, :description, :pubic
  validates :name, length: { maximum: 250}
  # validates :preparation_time, :cooking_time
  # validates :pubic
end