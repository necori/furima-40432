require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it "nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない場合' do
      it "nicknameが空では登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
     it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it "passwordが空では登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'パスワードは半角英字のみでは登録できない' do #パスワードは、半角英数字混合での入力が必須であること
        @user.password = 'abcdefghi'
        @user.password_confirmation = 'abcdefghi'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password should include both letters and numbers")
      end
      it 'パスワードは半角数字のみでは登録できない' do #パスワードは、半角英数字混合での入力が必須であること
        @user.password = '123456789'
        @user.password_confirmation = '123456789'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password should include both letters and numbers")
      end

      it 'パスワードは全角文字では登録できない' do #パスワードは、半角英数字混合での入力が必須であること
        @user.password = 'ＡＢＣＤ１２３４'
        @user.password_confirmation = 'ＡＢＣＤ１２３４'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password should include both letters and numbers")
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end
  end
end





    
  