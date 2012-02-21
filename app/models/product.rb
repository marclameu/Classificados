class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :mark
  belongs_to :user
 
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }

  default_scope order('price ASC')
  
  scope :filter_by_category, lambda {|category_name| 
    Product.joins(:category).where("categories.name = ?",[category_name])
   }
   
  scope :find_with_user, lambda {|id, user_id|
    Product.where("id = ? and user_id = ?", [id], [user_id])
  }
  #scope :filter, lambda { |low, high| where(:price => low..high) }
  #def self.filter(low, high)
  #  if ($link_atual == 'home')
  #    filtro = ''
  #  else
  #    filtro = $link_atual
  #  end
    
   # @products =  Product.joins(:category).where(" products.price >= ? and products.price <= ? and 
  #                                                  categories.name like ? ", low, high, "%#{filtro}%")

    #if (search)
     #Product.all(:conditions => [' price >= ? and price <= ? and name like ?', low, high, "%#{$link_atual}%"])
    #else
    # Product.all(:conditions => [' price >= ? and price <= ?', low, high])
   # end
 # end

  def self.high_low_prices
    [Product.minimum(:price), Product.maximum(:price)]
  end

  def self.search(search, page)
    paginate :per_page => 8, :page => page,
             :conditions => ['name like ?', "%#{search}%"], :order => 'name'
  end
end
