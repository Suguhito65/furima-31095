require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload("/files/test_image.png")
  end
  
  describe '商品情報の保存' do
    context "商品情報が保存できる場合" do
      it "画像や商品名、説明などがあれば保存できる" do
        expect(@item).to be_valid
      end
      it "価格が¥300〜9999999の間の場合保存できる" do
        @item.price = "300"
        @item.price = "9999999"
        expect(@item).to be_valid
      end
    end

    context "商品情報が保存できない場合" do
      it "ユーザーが紐づいていないと保存できない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
      it "画像がないと保存できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "商品名がないと保存できない" do
        @item.product = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Product can't be blank")
      end
      it "商品の説明がないと保存できない" do
        @item.description = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it "カテゴリーが---だと保存できない" do
        @item.category_id = "0"
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 0")
      end
      it "商品の状態が---だと保存できない" do
        @item.condition_id = "0"
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 0")
      end
      it "配送料の負担が---だと保存できない" do
        @item.burden_id = "0"
        @item.valid?
        expect(@item.errors.full_messages).to include("Burden must be other than 0")
      end
      it "発送元の地域が---だと保存できない" do
        @item.area_id = "0"
        @item.valid?
        expect(@item.errors.full_messages).to include("Area must be other than 0")
      end
      it "発送までの日数が---だと保存できない" do
        @item.deliveryday_id = "0"
        @item.valid?
        expect(@item.errors.full_messages).to include("Deliveryday must be other than 0")
      end
      it "価格が¥300未満だと保存できない" do
        @item.price = "299"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price  Out of setting range")
      end
      it "価格が¥9999999より上だと保存できない" do
        @item.price = "10000000"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price  Out of setting range")
      end
      it "価格が半角数字以外だと保存できない" do
        @item.price = "３００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price  Out of setting range")
      end
    end
  end
end

# bundle exec rspec spec/models/item_spec.rb