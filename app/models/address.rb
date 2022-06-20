class Address < ApplicationRecord

  belongs_to :customer

  # 宛先
  def full_address
    '〒' + postal_code + ' ' + address + ' ' + name
  end

  validates :post_code, presence: true
  validates :address, presence: true
  validates :address_name, presence: true

end
