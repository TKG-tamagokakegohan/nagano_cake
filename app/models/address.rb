class Address < ApplicationRecord

  belongs_to :customer

  # 宛先
  def full_address
    '〒' + post_code + ' ' + address + ' ' + address_name
  end


  validates :post_code, presence: true
  validates :address, presence: true
  validates :address_name, presence: true


end
