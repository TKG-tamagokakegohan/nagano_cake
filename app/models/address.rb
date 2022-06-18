class Address < ApplicationRecord
  #会員
  belongs_to :custome

  # 宛先
  def full_address
    '〒' + postal_code + ' ' + address + ' ' + name
  end
end
