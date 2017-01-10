class Dish < ApplicationRecord
  # Direct associations

  has_one    :dish,
             :class_name => "Dishesbyvenue",
             :foreign_key => "dishid",
             :dependent => :destroy

  # Indirect associations

  # Validations

  validates :cuisine, :presence => true

  validates :name, :presence => true

end
