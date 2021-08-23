require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user) 
  end

  describe '新規登録' do
    it 'Nicknameが空では登録できない' do 
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do 
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank" )
    end
    it 'emailが一意性でなければ登録できない' do 
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it 'emailは@を含まなかったら登録不可' do 
      @user.email = 'aaaaaaallllll.com'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid" )
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank" )
    end
    it 'passwordは半角英数字以外は不可であること' do
      @user.password = 'あおあお'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid" )
    end
    it 'passwordは6文字未満では登録できない' do 
      @user.password = 'gat44'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)" )
    end
    it 'passwordとpassword_confirmationが一致しなかったら登録できない' do 
      @user.password = 'hogehoge1111'
      @user.password_confirmation = 'hogehoge2222'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password" )
    end
    it 'family_nameは空では登録できないこと' do 
      @user.family_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank" )
    end
    it 'family_nameは全角以外不可' do 
      @user.family_name = 'village'
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name is invalid" )
    end
    it 'first_nameは空では登録できないこと' do 
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank" )
    end
    it 'first_nameは全角以外不可' do 
      @user.first_name = 'john'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid" )
    end
    it 'family_name_kanaは空では登録できないこと' do
      @user.family_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana is invalid" ) 
    end
    it 'family_name_kanaは全角カナ以外不可' do
      @user.family_name_kana = '中村'
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana is invalid" )  
    end
    it 'first_name_kanaは空では登録できないこと' do 
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank" )
    end
    it 'first_name_kanaは全角カナ以外不可' do 
      @user.first_name_kana = '吾郎'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid" )
    end
    it 'birth_dateは空では登録できないこと' do
      @user.birth_date = ' - - '
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth date can't be blank" ) 
    end
  end 

end
