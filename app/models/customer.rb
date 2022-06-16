class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #配送先
  #belongs_to :address
  #ログインする時に退会済み(is_active==false)のユーザーを弾くためのメソッド
  def active_for_authentication?
    #customerのis_activeがtrueならfalseを返すようにしている
    super && (self.is_active == true)
  end

end
