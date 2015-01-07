class Ingredient < ActiveRecord::Base
  belongs_to :recipe
  scope :with, -> (name) {where name: name}
end
