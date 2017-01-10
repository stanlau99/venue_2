class Bookmark < ApplicationRecord
  # Direct associations

  belongs_to :dish,
             :foreign_key => "dishid"

  # Indirect associations

  # Validations

end
