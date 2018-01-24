class User < ApplicationRecord
  has_many :positions
  has_many :stocks, through: :positions
  has_many :portfolios 
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.provider = auth.provider
      user.uid = auth.uid
      user.password = Devise.friendly_token[0,20]
    end
  end
  

  def can_add_stock?(ticker)
      !stock_already_owned?(ticker)
  end

  def stock_already_owned?(ticker)
    stock = Stock.find_by_ticker(ticker)
       return false unless stock 
   
       positions.where(stock_id: stock.id).exists?
   end

end
