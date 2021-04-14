require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザーの新規登録' do

    context "新規登録できるとき" do
        it "全ての項目の入力が存在すれば登録できる" do
          expect(@user).to be_valid
        end

        it "passwordが6文字以上、英数字混合であれば登録できる" do
          @user.password = '12345a'
          expect(@user).to be_valid
        end
      end

    context "新規登録できないとき" do
      it "nicknameがない場合は登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
    
      it "emailがない場合は登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "passwordがない場合は登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "family_nameがない場合は登録できない" do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end

      it "first_nameがない場合は登録できない" do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      
      it "family_name_kanaがない場合は登録できない" do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank")
      end

      it "first_name_kanaがない場合は登録できない" do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      
      it "birthdayがない場合は登録できない" do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end


      it "passwordが5文字以下であれば登録できない" do
        @user.password = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it "passwordが存在してもencrypted_passwordがない場合は登録できない" do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'family_nameが全角入力でなければ登録できない' do
        @user.family_name = 'ｱｲｳｴｵ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name is invalid")
      end

      it 'first_nameが全角入力でなければ登録できない' do
        @user.first_name = 'ｱｲｳｴｵ'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end

      it 'family_name_kanaが全角カタカナでなければ登録できない' do
        @user.family_name_kana = 'あいうえお'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana is invalid")
      end

      it 'first_name_kanaが全角カタカナでなければ登録できない' do
        @user.first_name_kana = 'あいうえお'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end
    end
  end
end