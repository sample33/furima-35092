require 'rails_helper'

RSpec.describe Profile, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order_profile = FactoryBot.build(:order_profile, user_id: @user.id, item_id: @item.id)
  end
  describe '購入情報の登録ができるとき' do

    context "購入情報の登録できるとき" do
        it "building以外の全ての項目の入力が存在すれば登録できる" do
          expect(@order_profile).to be_valid
        end
        it "buildingが空でも登録できる" do
          @order_profile.building = nil
          @order_profile.valid?
          expect(@order_profile).to be_valid
        end
    end

    context "新規登録できないとき" do
      it "zipがない場合は登録できない" do
        @order_profile.zip = nil
        @order_profile.valid?
        expect(@order_profile.errors.full_messages).to include("Zip can't be blank")
      end
      it "zipは英字では登録できない" do
        @order_profile.zip = 'aaaa'
        @order_profile.valid?
        expect(@order_profile.errors.full_messages).to include("Zip is invalid")
      end
      it "zipが半角数字出ないと登録できない" do
        @order_profile.zip = '２３６１２７８'
        @order_profile.valid?
        expect(@order_profile.errors.full_messages).to include("Zip is invalid")
      end
      it "zipが半角英数字混合だと登録できない" do
        @order_profile.zip = '324dfs'
        @order_profile.valid?
        expect(@order_profile.errors.full_messages).to include("Zip is invalid")
      end
      it "zipにハイフンがないとと登録できない" do
        @order_profile.zip = '1234567'
        @order_profile.valid?
        expect(@order_profile.errors.full_messages).to include("Zip is invalid")
      end
    
      it "area_id1が選択されている場合は登録できない" do
        @order_profile.area_id = 1
        @order_profile.valid?
        expect(@order_profile.errors.full_messages).to include("Area must be other than 1")
      end

      it "cityがない場合は登録できない" do
        @order_profile.city = nil
        @order_profile.valid?
        expect(@order_profile.errors.full_messages).to include("City can't be blank")
      end

      it "addressがない場合は登録できない" do
        @order_profile.address = nil
        @order_profile.valid?
        expect(@order_profile.errors.full_messages).to include("Address can't be blank")
      end

      it "telがない場合は登録できない" do
        @order_profile.tel = nil
        @order_profile.valid?
        expect(@order_profile.errors.full_messages).to include("Tel can't be blank")
      end
      it "telは英字では登録できない" do
        @order_profile.tel = 'aaaa'
        @order_profile.valid?
        expect(@order_profile.errors.full_messages).to include("Tel is not a number")
      end
      it "telが半角数字出ないと登録できない" do
        @order_profile.tel = '２３６１２７８'
        @order_profile.valid?
        expect(@order_profile.errors.full_messages).to include("Tel is invalid")
      end
      it "telが半角英数字混合だと登録できない" do
        @order_profile.tel = '324dfs'
        @order_profile.valid?
        expect(@order_profile.errors.full_messages).to include("Tel is not a number")
      end

      it "tokenが空では登録できないこと" do
        @order_profile.token = nil
        @order_profile.valid?
        expect(@order_profile.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end