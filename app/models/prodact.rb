class Prodact < ApplicationRecord
  validates_presence_of :name,:decription,:price,:quantity
  scope :prodacts, -> {
  where(:is_active =>  true)
}
  belongs_to :user ,optional: true
  resourcify
  
end
