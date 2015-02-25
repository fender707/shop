class Product < ActiveRecord::Base
  belongs_to :category
  has_many :line_items
  has_many :orders, through: :line_items

  validates_presence_of :title, :price, :count
  validates :title, length: { in: 3..120}
  #validates :category, presence: true

  ThinkingSphinx::Index.define :prod, :with => :active_record do
    indexes :title, :sortable => true
    indexes product.price
    indexes product.count
  end
    
  
end
