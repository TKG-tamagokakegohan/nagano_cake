class OrderDetail < ApplicationRecord
# 注文機能
    belongs_to :order
    belongs_to :item

def subtotal
  item.with_tax_price * item_count
end

end
