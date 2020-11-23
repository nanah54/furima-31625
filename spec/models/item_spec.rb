require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品登録' do
    context '商品出品登録がうまくいくとき' do
      it 'title, image, price, category_id, usage_status_id, postage_id, shipment_source_id, date_of_shipment_id, concept, user,が存在すれば登録できる' do
        expect(@item).to be_valid
      end
      it 'titleが1文字以上で登録できる' do
        @item.title = '1'
        expect(@item).to be_valid
      end
      it 'conceptが1文字以上で登録できる' do
        @item.concept = '1'
        expect(@item).to be_valid
      end
      it 'priceが300円以上で登録できる' do
        @item.price = '300'
        expect(@item).to be_valid
      end
    end

    context '商品出品登録がうまくいかないとき' do
      it 'imageが空だと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'titleが空だと登録できない' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      it 'conceptが空では登録できない' do
        @item.concept = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Concept can't be blank")
      end
      it 'category_idが空だと登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
      it 'usage_status_idが空では登録できない' do
        @item.usage_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Usage status must be other than 1')
      end

      it 'postage_idに＠が空では登録できない' do
        @item.postage_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Postage must be other than 1')
      end
      it 'shipment_source_idに＠が空では登録できない' do
        @item.shipment_source_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipment source must be other than 1')
      end
      it 'date_of_shipment_idに＠が空では登録できない' do
        @item.date_of_shipment_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Date of shipment must be other than 1')
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが全角では登録できない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price 半角数字を使用してください')
      end
      it 'priceの範囲が、¥300~¥9,999,999の間でないと登録できない' do
        @item.price = '200'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price 値段は300~9.999.999の間でお願いします')
      end
    end
  end
end
