class Order < ApplicationRecord
  belongs_to :profile
  has_one :payment
end
