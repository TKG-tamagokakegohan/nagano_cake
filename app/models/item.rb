class Item < ApplicationRecord
  belongs_to :genre
  has_many :cart_items
  # 注文機能
  has_many :order_details

  validates :price, presence: true

  has_one_attached :item_image

  validates :name, presence:true
  validates :introduction, presence:true
  validates :price, presence:true

  def get_item_image(width, height)
    unless item_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpeg')
      item_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    item_image.variant(resize_to_limit: [width, height]).processed
  end

## 消費税を求めるメソッド
  def with_tax_price
    (price * 1.1).floor
  end

## 小計を求めるメソッド
def subtotal
    item.with_tax_price * amount
end

end
