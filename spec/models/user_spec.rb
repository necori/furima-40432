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
            
      it "姓（全角）が空だと登録できない" do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it '姓（全角）に半角文字が含まれていると登録できない' do
        @user.last_name = 'format: { with: /\A[ぁ-んァ-ン一-龥]/ }'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
      it "名（全角）が空だと登録できない" do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "名（全角）に半角文字が含まれていると登録できない" do
        @user.first_name = 'format: { with: /\A[ぁ-んァ-ン一-龥]/ }'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it "姓（カナ）が空だと登録できない" do
        @user.read_last = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Read last is invalid")
      end
      it '姓（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
        @user.read_last = 'format: { with: /\A[ァ-ヶー－]+\z/ }'
        @user.valid?
        expect(@user.errors.full_messages).to include('Read last is invalid')
      end
      it "名（カナ）が空だと登録できない" do
        @user.read_first = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Read first is invalid")
      end
      it "名（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない" do
        @user.read_first = 'format: { with: /\A[ァ-ヶー－]+\z/ }'
        @user.valid?
        expect(@user.errors.full_messages).to include("Read first is invalid")
      end
    end
  end
end





    
  