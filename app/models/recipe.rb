class Recipe < ApplicationRecord
  # Association
  belongs_to :user, foreign_key: 'user_id'
  has_many :recipe_foods, dependent: :destroy
  has_many :foods, through: :recipe_foods

  # Validations
  validates :name, :preparation_time, :cooking_time, :description, presence: true
  # validates_presence_of :name, :preparation_time, :cooking_time, :description
  # validates :name, length: { maximum: 250}
  # validates :preparation_time, :cooking_time
  # validates :pubic
end
