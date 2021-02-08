require 'rails_helper'

#RSpec.describe User, type: :model do
#  pending "add some examples to (or delete) #{__FILE__}"
#end

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
   context '新規登録できるとき' do
    it 'nickname、email、encrypted_password、password_confirmation、last_name、first_name、last_name_kana、first_name_kana、birth_date、入力で登録' do
      expect(@user).to be_valid
    end
   end

   context '新規登録できないとき' do 
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordが存在してもpassword_confirmationが空では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it '重複したemailが存在する場合登録できない' do 
      @user.save
      @another_user = FactoryBot.build(:user)
      @another_user.email = @user.email
      @another_user.valid?
      expect(@another_user.errors.full_messages).to include("Email has already been taken")
    end

    it "emailに@とドメインがない場合は登録できないこと " do
      @user.email = 'sample.com'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it 'passwordが5文字以下では登録できない' do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'passwordが英語のみでは登録できない' do
      @user.password = 'asdfrs'
      @user.password_confirmation = 'asdfrs'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password 半角英数字6文字以上で入力して下さい')
    end

    it 'passwordが数字のみでは登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password 半角英数字6文字以上で入力して下さい')
    end

    it 'passwordが全角では登録できない' do
      @user.password = 'ああああああ'
      @user.password_confirmation = 'ああああああ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password 半角英数字6文字以上で入力して下さい')
    end

    it "性が空だと登録できない" do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it "名が空だと登録できない" do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it "姓カナが空だと登録できない" do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end

    it "名カナが空だと登録できない" do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end

    it "姓が英語数字だと登録できない" do
      @user.last_name = 'aaa123'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name 全角(漢字・ひらがな・カタカナ)のみで入力して下さい")
    end

    it "名が英語数字だと登録できない" do
      @user.first_name = 'aaa123'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name 全角(漢字・ひらがな・カタカナ)のみで入力して下さい")
    end

    it "姓カナが漢字数字英語ひらがなだと登録できない" do
      @user.last_name_kana = '代1qweあ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana 全角カタカナのみで入力して下さい")
    end

    it "名カナが漢字数字英語ひらがなだと登録できない" do
      @user.first_name_kana = '代1qweあ'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana 全角カタカナのみで入力して下さい")
    end
   
    it '誕生日が空では登録できない' do
      @user.birth_date = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth date can't be blank")
    end
  
  end
  end
end
