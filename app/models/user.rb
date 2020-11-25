class User < ApplicationRecord
  has_one :address, dependent: :destroy
  has_one :credit_card
  accepts_nested_attributes_for :address

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

  validates :nickname,         presence: true, uniqueness: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,            presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :password,         presence: true, length: { in: 7..127 }, confirmation: true
  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/
  validates :family_name,      presence: true, format: { with: VALID_NAME_REGEX }
  validates :first_name,       presence: true, format: { with: VALID_NAME_REGEX }
  VALID_KANA_REGEX = /\A[ァ-ヶー－]+\z/
  validates :family_name_kana, presence: true, format: { with: VALID_KANA_REGEX }
  validates :first_name_kana,  presence: true, format: { with: VALID_KANA_REGEX }
  validates :birthday,         presence: true
end

