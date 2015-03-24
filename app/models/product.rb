class Product < ActiveRecord::Base
  belongs_to :category
  has_many :line_items
  has_many :orders, through: :line_items

  validates_presence_of :title, :price, :count
  validates :title, length: { in: 3..120}
  #validates :category, presence: true    

  before_save :set_keywords


  def self.search(keyword)
    if keyword.present?
     where('keywords like ?', "%#{keyword.downcase}%" ) 
    else
      all
    end 
  end

  def self.filter(category_id)
    where('products.category_id= ?', category_id)
  end
 
  protected 
   
    def set_keywords
      self.keywords = [title,description].map{|p| p.downcase}.join(' ') 
    end
end
