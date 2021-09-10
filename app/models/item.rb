class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do

    validates :product_name
    validates :description
    validates :category_id
    validates :product_condition_id
    validates :shipping_cost_id
    validates :delivery_id
    validates :shipping_day_id
    validates :image
    validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 10000000, message: 'is invalid'}
  end
end
