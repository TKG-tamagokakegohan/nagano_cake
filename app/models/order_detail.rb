class OrderDetail < ApplicationRecord
# 注文機能
    belongs_to :order
    belongs_to :item
end
