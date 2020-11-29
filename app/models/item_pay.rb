class Itempay
  include ActiveModel::Model
  attr_accessor   :postal_code , :prefecture , :municipality , :address,  :building_name,:phone_number,

  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :municipality, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
    validates :address, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
  end
  validates :prefecture, numericality: { other_than: 1, message: "can't be blank" }
  def save
    # 各テーブルにデータを保存する処理を書く
    Address.create(postal_code: postal_code, prefecture: prefecture, city: city, house_number: house_number, building_name: building_name,user_id: user.id)
    # 寄付金の情報を保存
    Donation.create(price: price, user_id: user.id)
  end
end

  end
end