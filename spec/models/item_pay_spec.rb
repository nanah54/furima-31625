require 'rails_helper'

RSpec.describe ItemPay, type: :model do
  before do
    @item_pay = FactoryBot.build(:item_pay)
  end

  describe '商品購入' do
    context '商品購入がうまくいく時' do
      it 'postal_codeとprefecture_id, municipality ,address, phone_number,tokenが存在すれば登録できる' do
        expect(@item_pay).to be_valid
      end
      it 'building_name は空でも保存ができる' do
        @item_pay.building_name = ''
        expect(@item_pay).to be_valid
      end
    end

    context '商品購入がうまくいかない時' do
      it 'tokenが空では登録できないこと' do
        @item_pay.token = nil
        @item_pay.valid?
        expect(@item_pay.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空だと登録できない' do
        @item_pay.postal_code = ''
        @item_pay.valid?
        expect(@item_pay.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'postal_codeが-(ハイフン)なしだと登録できない' do
        @item_pay.postal_code = '1234567'
        @item_pay.valid?
        expect(@item_pay.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'prefecture_idが未選択だと登録できない' do
        @item_pay.prefecture_id = '1'
        @item_pay.valid?
        expect(@item_pay.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'municipalityが空だと登録できない' do
        @item_pay.municipality = ''
        @item_pay.valid?
        expect(@item_pay.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'addressが空だと登録できない' do
        @item_pay.address = ''
        @item_pay.valid?
        expect(@item_pay.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空だと登録できない' do
        @item_pay.phone_number = ''
        @item_pay.valid?
        expect(@item_pay.errors.full_messages).to include("Phone number can't be blank", 'Phone number is invalid.  Input half-width character & not hyphen(-)')
      end
      it 'phone_numberが１２桁以上だと登録できない' do
        @item_pay.phone_number = '080123456789'
        @item_pay.valid?
        expect(@item_pay.errors.full_messages).to include("Phone number is invalid.  Input half-width character & not hyphen(-)")
      end
      it 'phone_numberにハイフンが入っている場合は登録できない' do
        @item_pay.phone_number = '080-12345678'
        @item_pay.valid?
        expect(@item_pay.errors.full_messages).to include("Phone number is invalid.  Input half-width character & not hyphen(-)")
      end
    end
  end
end
