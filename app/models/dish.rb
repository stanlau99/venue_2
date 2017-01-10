class Dish < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :cuisine, :presence => true

  validates :name, :presence => true

end
