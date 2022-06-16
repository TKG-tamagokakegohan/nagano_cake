class Address < ApplicationRecord
  #会員
  has_many :customers, dependent: :destroy
end
