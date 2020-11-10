class Address < ApplicationRecord
  belongs_to :user

  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/
  validates :family_name, presence: true, format: { with: VALID_NAME_REGEX }
  validates :first_name, presence: true, format: { with: VALID_NAME_REGEX }
  VALID_KANA_REGEX = /\A[ァ-ヶー－]+\z/
  validates :family_name_kana, presence: true, format: { with: VALID_KANA_REGEX }
  validates :first_name_kana, presence: true, format: { with: VALID_KANA_REGEX }
  validates :postcode, presence: true
  validates :prefecture, presence: true
  validates :city, presence: true
  validates :block, presence: true
end
