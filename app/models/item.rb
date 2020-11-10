class Item < ApplicationRecord
  has_many_attached :images
  with_options presence: true do
    validates :name
    validates :description
    validates :status
    validates :freight
    validates :shipment_source
    validates :ship_date
    validates :price
    validates :images
    validates :category_id
  end
end
