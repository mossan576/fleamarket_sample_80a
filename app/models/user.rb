class User < ApplicationRecord
  has_one :address, dependent: :destroy
  accepts_nested_attributes_for :address

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
