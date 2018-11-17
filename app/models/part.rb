class Part < ApplicationRecord
  belongs_to :book
	has_many :questions
  accepts_nested_attributes_for :questions
end
