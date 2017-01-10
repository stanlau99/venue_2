class Dishesbyvenue < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :dishid, :presence => true

  validates :venueid, :presence => true

end
