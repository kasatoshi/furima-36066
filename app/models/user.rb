class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD_REGEX =/\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[\d])\w{6}\z/
    validates :password, presence: true,
            format: { with: VALID_PASSWORD_REGEX,}

   with_options presence: true do
    validates :nickname
    validates :birthday
     with_options { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/} do
      validates :last_name format: 
      validates :first_name format: 
   end
    with_options { with: /\A[ァ-ヶ]+\z/} do
      validates :last_name_kana format: { with: /\A[ァ-ヶ]+\z/}
      validates :first_name_kana format: { with: /\A[ァ-ヶ]+\z/}
    end
  end
end
