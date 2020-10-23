require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nicknameとemail、passwordとpassword_confirmationなどが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "passwordが6文字以上でかつ英数字混合であれば登録できる" do
        @user.password = "aaaaa1"
        @user.password_confirmation = "aaaaa1"
        expect(@user).to be_valid
      end
      it "lase_nameとfirst_nameが全角(カタカナ)で入力だと登録できる" do
        @user.last_name = "田中"
        @user.first_name = "太郎"
        expect(@user).to be_valid
      end
      it "lase_name_readingとfirst_name_readingが全角(カタカナ)で入力だと登録できる" do
        @user.last_name = "タナカ"
        @user.first_name = "タロウ"
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空だと登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "passwordが空だと登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordに数字が含まれてないと登録できない" do
        @user.password = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = "aaaa1"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが存在してもpassword_confirmationが空だと登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "last_nameが空だと登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "lase_nameが全角(漢字、ひらがな、カタカナ)で入力でないと登録できない" do
        @user.last_name = "aa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name Full-width characters.")
      end
      it "first_nameが空だと登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "first_nameが全角(漢字、ひらがな、カタカナ)で入力でないと登録できない" do
        @user.first_name = "aa"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name Full-width characters.")
      end
      it "last_nameが空だと登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "lase_name_readingが全角(カタカナ)で入力でないと登録できない" do
        @user.last_name_reading = "a亜"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name reading Full-width katakana characters.")
      end
      it "first_nameが空だと登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "firse_name_readingが全角(カタカナ)で入力でないと登録できない" do
        @user.first_name_reading = "a亜"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name reading Full-width katakana characters.")
      end
      it "birthdayが空だと登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
