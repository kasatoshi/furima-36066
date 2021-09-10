require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  context  '商品登録ができる時' do
    it '商品画像、商品名、商品説明、商品の詳細、配送について、販売価格があれば登録できること' do
      expect(@item).to be_valid
    end
  end



  context '投稿ができない' do
    it 'ユーザーが紐付いていなければ投稿できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('User must exist')
    end

    it '画像がない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it '商品名がない' do
      @item.product_name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Product name can't be blank")
    end

    it '商品の説明がない' do
      @item.description = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end


    it '価格は半角文字の入力' do
      @item.price = '111111111'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is invalid")
    end


    it '価格が設定範囲外' do
      @item.price = "9999999999999999999"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is invalid")
    end

    it 'カテゴリーを空白にすることはできません' do
      @item.category_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it '販売価格を空白にできない' do
      @item.price = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it "配送料のステータスが空白にならない" do
      @item.product_condition_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Product condition can't be blank")
    end

    it "都道府県は空欄に出来ない" do
      @item.delivery_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery can't be blank")
    end

    
    it "発送までの日数が空欄に出来ない" do
      @item.shipping_day_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping day can't be blank")
    end
  end
end