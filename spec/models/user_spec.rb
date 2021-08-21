require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  context  'ユーザ登録ができる時' do
  it 'nicknameとemail、passwordとpassword_confirmation、名字(全角)と名前(全角)、名字(カナ)と名前(カナ)、生年月日が存在すれば登録できること' do
    expect(@user).to be_valid
  end

 end


  context 'ユーザー新規登録できない時' do
    it 'nicknameが空だと登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "passwordが空では登録できないこと" do
      @user.password = ""
      @user.valid?
      expect(@user.errors[:password]).to include("can't be blank")
    end
    
    it "passwordが存在してもpassword_confirmationがない場合は登録できないこと" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors[:password_confirmation]).to include("doesn't match Password")
    end
    

    it "重複したemailが存在する場合登録できないこと" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    
    
    it "passwordが5文字以下である場合は登録できないこと" do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')    
    end
  end
end