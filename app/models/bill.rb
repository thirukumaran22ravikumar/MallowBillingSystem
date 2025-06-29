class Bill < ApplicationRecord
	has_many :bill_items, dependent: :destroy
  	has_many :bill_denominations, dependent: :destroy
end
