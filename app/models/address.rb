class Address < ApplicationRecord
  
  belongs_to :customer

  # 宛先
  def full_address
    '〒' + postal_code + ' ' + address + ' ' + name
  end
  
end
