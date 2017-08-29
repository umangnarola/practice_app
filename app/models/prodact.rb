class Prodact < ApplicationRecord
  validates_presence_of :name,:price
  has_many :order_items
  scope :prodacts, -> {
  where(:is_active =>  true)
}
  belongs_to :user ,optional: true
  resourcify
end
