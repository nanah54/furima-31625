class ShippingAddress < ApplicationRecord
  belongs_to :buyer
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  with_options numericality: { other_than: 1 } do
    validates :prefecture_id 
  end
end
