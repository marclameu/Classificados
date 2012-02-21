class User < ActiveRecord::Base
  has_many :products
  validates_presence_of :name, :message => "campo de preenchimento obrigatorio!" 
  validates_presence_of :phone, :message => "campo de preenchimento obrigatorio!" 
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :trackable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  
  def get_my_products
    Self.products
  end
end
