class Address < ApplicationRecord
  belongs_to :user

  validates :family_name, presence: true
  validates :first_name, presence: true
  validates :family_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :postcode, presence: true
  validates :prefecture, presence: true
  validates :city, presence: true
  validates :block, presence: true
end
