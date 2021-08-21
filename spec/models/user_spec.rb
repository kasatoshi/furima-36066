require 'rails_helper'
RSpec.describe User, type: :model do
  

  context  'ユーザ登録ができる時' do
  it "nicknameが6文字以下であれば登録できること" do
    user = build(:user, nickname: "123456")
    user.valid?
    expect(user).to be_valid
  end

  it 'nicknameとemail、passwordとpassword_confirmation、名字(全角)と名前(全角)、名字(カナ)と名前(カナ)、生年月日が存在すれば登録できること' do
    expect(@user).to be_valid
  end

  it "passwordが6文字以上であれば登録できること" do
    user = build(:user, password: "123456", password_confirmation: "123456")
    user.valid?
    expect(user).to be_valid
  end


  context 'ユーザー新規登録' do
    it 'nicknameが空だと登録できない' do
      user = User.new(nickname: '', email: 'kkk@gmail.com', password: '00000000', password_confirmation: '00000000')
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      user = User.new(nickname: 'abe', email: '', password: '00000000', password_confirmation: '00000000')
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end

    it "passwordが空では登録できないこと" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end
    
    it "passwordが存在してもpassword_confirmationがない場合は登録できないこと" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end
 
    
    it "nicknameが7文字以上であれば登録できないこと" do
      user = build(:user, nickname: "1234567")
      user.valid?
      expect(user.errors[:nickname]).to include("is too long (maximum is 6 characters)")
    end
    

    it "重複したemailが存在する場合登録できないこと" do
      user = create(:user)
      another_user = build(:user)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end
    
    
    it "passwordが5文字以下である場合は登録できないこと" do
      user = build(:user, password: "12345", password_confirmation: "12345")
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
    end

    it "emailに関して@が含まれていないと登録できないこと  " do
        @user.email = 'hogehuga.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
    end


    it "パスワードに関して英字のみでは登録できないこと " do
        @user.password = 'asdzxc'
        @user.password_confirmation = 'asdzxc'
        @user.valid?
        expect(@user.errors.full_messages).to include('Please set the password as a mixture of letters and numbers')
      end



    it "パスワードに関して数字のみでは登録できないこと " do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Please set the password as a mixture of letters and numbers')
      end



    it "パスワードに関して全角だと登録できないこと " do
        @user.password = 'ＡＢｃ１２３'
        @user.password_confirmation = 'ＡＢｃ１２３'
        @user.valid?
        expect(@user.errors.full_messages).to include('Please set the password as a mixture of letters and numbers')
      end


    it "ユーザー名に関して空では登録できないこと " do
        user = build(:user: "")
        user.valid?
        expect(user.errors).to include("can't be blank")
    end


    it "ユーザー名に関して英字のみでは登録できないこと" do
        user = 'asdzxc'
        user.valid?
        expect(user.errors.full_messages).to include('Please set the password as a mixture of letters and numbers')
    end
    

    it 'last_nameが全角文字でなければ登録できない' do
      @user.last_name = 'hoge'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name Use full-width katakana.')
    end


    it 'first_nameが全角文字でなければ登録できない' do
      @user.first_name = 'huga'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name Use full-width katakana.')
    end


    it 'last_name_kanaが全角カタカナでなければ登録できない' do
      @user.last_name_kana = 'あああああ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name kana Use full-width katakana.')
    end

    it 'first_name_kanaが全角カタカナでなければ登録できない' do
      @user.first_name_kana = 'ｱｱｱｱｱ'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana Use full-width katakana.')
    end
  end
end
