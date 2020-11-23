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
  validates :title, presence: true
  validates :category_id, numericality: { other_than: 1 }
  validates :usage_status_id, numericality: { other_than: 1 }
  validates :postage_id, numericality: { other_than: 1 }
  validates :shipment_source_id, numericality: { other_than: 1 }
  validates :date_of_shipment_id, numericality: { other_than: 1 }
  validates :price, presence: true
  validates :image, presence: true
  validates :concept, presence: true
  with_options presence: true, numericality: { with: /\A^[0-9]+$\z/, message: '半角数字を使用してください' } do
    validates :price
  end
  validates_inclusion_of :price, in: 300..9_999_999, message: '値段は300~9.999.999の間でお願いします'
end
