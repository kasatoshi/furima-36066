class Item < ApplicationRecord
 
  belongs_to :user
  has_one_attached :image
  has_one :order
 extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :product_condition
  belongs_to :shipping_cost
  belongs_to :delivery
  belongs_to :shipping_day

  with_options presence: true do
    validates :product_name
    validates :description
    validates :image
  end

  with_options numericality: { other_than: 1 }  do
    validates :category_id
    validates :product_condition_id
    validates :shipping_cost_id
    validates :delivery_id
    validates :shipping_day_id
  end

  


    validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 10000000, message: 'is invalid'}

end