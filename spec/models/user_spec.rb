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

    it "emailに関して@が含まれていないと登録できないこと" do
        @user.email = 'test,example.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
    end


    it "パスワードに関して英字のみでは登録できないこと " do
        @user.password = 'aaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end



    it "パスワードに関して数字のみでは登録できないこと " do
        @user.password = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end



    it "パスワードに関して全角だと登録できないこと " do
        @user.password = "ＡＡＡＡＡ１１"
        @user.password_confirmation = 'ＡＡＡＡＡ１１'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it 'last_nameが空では登録できないこと' do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end

    it 'last_nameが全角文字でなければ登録できない' do
        @user.last_name = "kana"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end


    it 'first_nameが空では登録できないこと' do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end


    it 'first_nameが全角文字でなければ登録できない' do
        @user.first_name = "kana"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end

    it 'last_name_kanaが空では登録できないこと' do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end


    it 'last_name_kanaが全角カタカナでなければ登録できない' do
        @user.last_name_kana = "かな"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end

    it 'first_name_kanaが空では登録できないこと' do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end


    it 'first_name_kanaが全角カタカナでなければ登録できない' do
        @user.first_name_kana = "かな"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end
  end
end