require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end
    it "すべての情報が正しく入力されていれば新規登録が正常に完了する" do
      expect(@user).to be_valid
    end

    it "ニックネームが必須であること" do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "メールアドレスが必須であること" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "メールアドレスが一意性であること" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it "メールアドレスは、@を含む必要があること" do
      @user.email = 'test.test'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it "パスワードが必須であること" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "パスワードは、6文字以上で入力が必須であること" do
      @user.password = "00000"
      @user.password_confirmation = "00000"
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
    end
    it "パスワードが英字のみでは登録できない" do
      @user.password = "aaaabbbb"
      @user.password_confirmation = "aaaabbbb"
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid"
    end

    it "パスワードは、半角英数字混合で入力が必須であること" do
      @user.password = "000000"
      @user.password_confirmation = "000000"
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid"
    end

    it "パスワードは確認用を含めて2回入力すること" do
      @user.password = "test@test"
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end

    it "パスワードとパスワード(確認用)、値の一致が必須であること" do
      @user.password = "test@test"
      @user.password_confirmation = "test@aaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end

    it "ユーザー本名は、苗字が必須であること" do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end

    it "ユーザー本名は、名前が必須であること" do
      @user.second_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Second name can't be blank"
    end

    it "ユーザー苗字は全角(漢字・ひらがな・カタカナ)での入力が必須であること" do
      @user.first_name = "000000"
      @user.valid?
      expect(@user.errors.full_messages).to include "First name is invalid. Input full-width characters."
    end

    it "ユーザー名前は全角(漢字・ひらがな・カタカナ)での入力が必須であること" do
      @user.second_name = "000000"
      @user.valid?
      expect(@user.errors.full_messages).to include "Second name is invalid. Input full-width characters."
    end

    it "ユーザー本名のフリガナは、苗字が必須であること" do
      @user.first_katakana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "First katakana can't be blank"
    end

    it "ユーザー本名のフリガナは、名前が必須であること" do
      @user.second_katakana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Second katakana can't be blank"
    end

    it "ユーザー本名の苗字のフリガナは、全角(カタカナ)での入力が必須であること" do
      @user.first_katakana = "愛知県"
      @user.valid?
      expect(@user.errors.full_messages).to include "First katakana is invalid. Input full-width katakana characters."
    end

    it "ユーザー本名の名前のフリガナは、全角(カタカナ)での入力が必須であること" do
      @user.second_katakana = "あいちけん"
      @user.valid?
      expect(@user.errors.full_messages).to include "Second katakana is invalid. Input full-width katakana characters."
    end

    it "生年月日が必須であること" do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
