class CreditCard < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :card_id
    validates :customer_id
  end

  with_options uniqueness: true do
    validates :card_id
    validates :customer_id
  end

end
