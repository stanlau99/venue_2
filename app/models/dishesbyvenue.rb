class Dishesbyvenue < ApplicationRecord
  # Direct associations

  belongs_to :dish,
             :foreign_key => "dishid"

  # Indirect associations

  # Validations

  validates :dishid, :presence => true

  validates :venueid, :presence => true

end
