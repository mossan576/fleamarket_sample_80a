class Item < ApplicationRecord
  has_many_attached :images
  belongs_to :user
  belongs_to :category
  
  with_options presence: true do
    validates :name
    validates :description
    validates :status
    validates :freight
    validates :shipment_source
    validates :ship_date
    validates :price
    validates :images
    validates :user_id
    validates :category_id
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  
end
