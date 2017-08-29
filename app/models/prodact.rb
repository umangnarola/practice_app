class Prodact < ApplicationRecord
  validates_presence_of :name,:decription,:price,:quantity
  has_many :order_items
  scope :prodacts, -> {
  where(:is_active =>  true)
}
  # default_scope { where(active: true) }
  belongs_to :user ,optional: true
  resourcify

end
