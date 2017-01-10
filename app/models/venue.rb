class Venue < ApplicationRecord
  # Direct associations

  has_many   :bookmarks,
             :foreign_key => "venueid",
             :dependent => :destroy

  has_many   :dishes,
             :class_name => "Dishesbyvenue",
             :foreign_key => "venueid",
             :dependent => :destroy

  # Indirect associations

  # Validations

  validates :address, :presence => true

  validates :name, :presence => true

end
