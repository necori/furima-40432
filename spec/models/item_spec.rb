require 'rails_helper'

RSpec.describe Item, type: :model do
    before do
    @item = FactoryBot.build(:item)
  end

describe '商品情報の保存' do
 context'商品情報の保存ができるとき' do
  it '正常に保存できるとき' do
     @item = FactoryBot.build(:item, product_name: 'saifu', product_description: 'beautiful', category_id: '01', condition_id: '01', shipping_id: '01', prefecture_id: '01', duration_id: '01', price: 10000)
    end
   end
  
 context'商品情報の保存ができないとき' do
  it '商品の画像が空では保存できない' do
    @item.image.purge
    @item.valid?
    expect(@item.errors.full_messages).to include("Image can't be blank")
   end

  it '商品名が空では保存できない' do
    @item.product_name = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Product name can't be blank")
  end

  it '商品の説明が空では保存できない' do
    @item.product_description = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Product description can't be blank")
  end

  it 'カテゴリー情報が空では保存できない' do
    @item.category_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Category can't be blank")
  end

  it '商品の状態の情報が空では保存できない' do
    @item.condition_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Condition can't be blank")
  end

  it '配送料の負担の情報が空では保存できない' do
    @item.shipping_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Shipping can't be blank")
  end

  it '発送元の地域の情報が空では保存できない' do
    @item.prefecture_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Prefecture can't be blank")
  end

  it '発送までの日数の情報が空では保存できない' do
    @item.duration_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Duration can't be blank")
  end

  it '価格の情報が空では保存できない' do
    @item.price = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Price can't be blank")
  end

  it '価格は￥299以下では保存できない' do
    @item.price = '299'
    @item.valid?
    expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
  end

  it '価格は￥1,000,000以上では保存できない' do
    @item.price = '100000000'
    @item.valid?
    expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
  end

  it '価格は半角数値以外では保存できない' do
    @item.price = 'ＡＡＡ'
    @item.valid?
    expect(@item.errors.full_messages).to include("Price must be half-width numbers")
   end
  end
 end
end


