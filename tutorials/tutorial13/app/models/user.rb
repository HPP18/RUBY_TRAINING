class User < ApplicationRecord
  validates :name, presence: true
  validates :address, presence: true
  validates :phone, presence: true, length: { maximum: 11 }
end
