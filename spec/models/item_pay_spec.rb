require 'rails_helper'

RSpec.describe ItemPay, type: :model do
  before do
    @item_pay = FactoryBot.build(:item_pay)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it 'postal_codeとprefecture_id, municipality ,address, phone_number,が存在すれば登録できる' do
        expect(@item_pay).to be_valid
      end
     
    end

    context '新規登録がうまくいかないとき' do
      it 'postal_codeが空だと登録できない' do
        @item_pay.postal_code = ''
        @item_pay.valid?
        expect(@item_pay.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
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
        expect(@item_pay.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid.  Input half-width character")
      end
    end
  end
end