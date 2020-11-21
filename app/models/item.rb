class Item < ApplicationRecord

  belongs_to :user
  has_one :buyer
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :usage_status
  belongs_to :postage
  belongs_to :shipment_source
  belongs_to :date_of_shipment
  validates :title,  presence: true
  validates :category_id , numericality: { other_than: 1 } 
  validates :usage_status_id, numericality: { other_than: 1 } 
  validates :postage_id, numericality: { other_than: 1 } 
  validates :shipment_source_id, numericality: { other_than: 1 } 
  validates :date_of_shipment_id, numericality: { other_than: 1 } 
  validates :price,  presence: true
end
