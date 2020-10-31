require 'rails_helper'

RSpec.describe Purchase, type: :model do
  describe '商品購入情報の保存' do
    before do
      @purchase = FactoryBot.build(:purchase)
    end

    it 'すべての値が正しく入力されていれば保存できる' do
      expect(@purchase).to be_valid
    end
    it 'postal_codeが空だと保存できない' do
      @purchase.postal_code = ""
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できない' do
      @purchase.postal_code = "1234567"
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end
    it 'prefectureが---だと保存できない' do
      @purchase.prefecture_id = 0
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'cityが空だと保存できない' do
      @purchase.city = ""
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("City can't be blank")
    end
    it 'house_numberが空だと保存できない' do
      @purchase.house_number = ""
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("House number can't be blank")
    end
    it 'building_nameは空でも保存できる' do
      @purchase.building_name = ""
      expect(@purchase).to be_valid
    end
    it 'phone_numberが空だと保存できない' do
      @purchase.phone_number = ""
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'phone_numberは11桁以内の数字でないと保存できない' do
      @purchase.phone_number = "123456789012"
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Phone number Input only number")
    end
  end
end

# bundle exec rspec spec/models/purchase_spec.rb