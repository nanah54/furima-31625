class Item < ApplicationRecord
  belongs_to :user
  has_one :buyer
  has_one_attached :image


  def self.search(search)
    if search != ""
      Item.where('title LIKE (?)', "%#{search}%" )
    else
      Item.all
    end
  end


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :usage_status
  belongs_to :postage
  belongs_to :shipment_source
  belongs_to :date_of_shipment

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :usage_status_id
    validates :postage_id
    validates :shipment_source_id
    validates :date_of_shipment_id
  end
  with_options presence: true do
    validates :price
    validates :image
    validates :concept
    validates :title
  end
  with_options presence: true, numericality: { with: /\A^[0-9]+$\z/, message: '半角数字を使用してください' } do
    validates :price
  end
  validates_inclusion_of :price, in: 300..9_999_999, message: '値段は300~9.999.999の間でお願いします'
end
