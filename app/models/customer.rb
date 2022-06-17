class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #配送先
  has_many :addresses, dependent: :destroy

  #ログイン時に退会済みのユーザーが同じアカウントでログイン出来ないよう制約
  def active_for_authentication?
    #customerのis_activeがtrueならfalseを返すようにしている
    super && (self.is_active == true)
  end

  #バリデーション(email,password,is_active以外)
  validates :last_name, presence:true
  validates :first_name, presence:true
  validates :last_name_kata, presence:true
  validates :first_name_kata, presence:true
  validates :post_code, presence:true
  validates :address, presence:true
  validates :phone_number, presence:true

end
