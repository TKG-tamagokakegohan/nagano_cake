class CartItem < ApplicationRecord
   belongs_to :item
   belongs_to :customer
# 注文機能
   # belongs_to :order


def sum_price # 実際に作成したサイトは税金も算出していたのでメソッドを記載していました
  item.with_tax_price*item_count
end
end
