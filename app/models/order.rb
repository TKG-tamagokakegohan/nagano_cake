class Order < ApplicationRecord
belongs_to :customer
# 注文機能
has_many :order_details


  enum order_status: { "入金待ち": 0, "入金確認": 1, "製作中": 2, "発送準備中": 3, "発送済み": 4}
  enum payment_method: { credit_card: 0, transfer: 1 }
 
end
