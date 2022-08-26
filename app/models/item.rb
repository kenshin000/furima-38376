class Item < ApplicationRecord
  validates :image, presence: true
  validates :name, presence: true
  validates :item_explain, presence: true
  validates :price, presence: true,
                    numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, only_integer: true }, format: { with: /\A[0-9]+\z/ }
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }, presence: true
  validates :situation_id, numericality: { other_than: 1, message: "can't be blank" }, presence: true
  validates :area_id, numericality: { other_than: 1, message: "can't be blank" }, presence: true
  validates :send_day_id, numericality: { other_than: 1, message: "can't be blank" }, presence: true
  validates :send_load_id, numericality: { other_than: 1, message: "can't be blank" }, presence: true

  belongs_to :user
  has_one :order
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :situation
  belongs_to :area
  belongs_to :send_load
  belongs_to :send_day
end
