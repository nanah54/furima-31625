class Item < ApplicationRecord

  belongs_to :user
  has_one :buyer
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  has_many :genre
  validates :title, :text, presence: true
  validates :genre_id, numericality: { other_than: 1 } 
end
