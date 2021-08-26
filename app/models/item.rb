class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :name, :info, :price, presence: true
  validates :price, format: { with: /\A[0-9]+\z/ } 
  validates :price, numericality: { greater_than_or_equal_to: 333, less_than_or_equal_to: 9999999 }
  validates :image, presence: true
  validates :category_id, :delivery_date_id, :delivery_fee_id, :prefecture_id, :status_id, numericality: { other_than: 1 , message: "can't be blank"}

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :delivery_date
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :status

end
