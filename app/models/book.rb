class Book < ApplicationRecord
	has_many :parts
  accepts_nested_attributes_for :parts
end
