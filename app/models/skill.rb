class Skill < ApplicationRecord
  validates :title, :presence => true
  validates :category, :presence => true, inclusion: { in: %w( Sports Music Cooking Home Education Programming Fitness) }

  has_many :posts
end
