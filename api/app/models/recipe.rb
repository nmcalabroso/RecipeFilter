class Recipe < ActiveRecord::Base
  belongs_to :user
  has_many :ingredients
  has_many :steps

  def with_ingredient?(ingredient)
    self.ingredients.exists?('lower(name) = ?', ingredient)
  end

  def without_ingredient?(ingredient)
    not self.ingredients.exists?('lower(name) = ?', ingredient)
  end

  def self.filter(with, without, order, count)
  end
end
