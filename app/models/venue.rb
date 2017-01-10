class Venue < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :address, :presence => true

  validates :name, :presence => true

end
