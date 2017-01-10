class Dish < ApplicationRecord
  # Direct associations

  has_many   :bookmarks,
             :foreign_key => "dishid",
             :dependent => :destroy

  has_one    :dish,
             :class_name => "Venuedish",
             :foreign_key => "dishid",
             :dependent => :destroy

  # Indirect associations

  # Validations

  validates :cuisine, :presence => true

  validates :name, :presence => true

end
