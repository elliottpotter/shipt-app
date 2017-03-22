class Customer < ApplicationRecord
  has_many :orders
  has_many :products, through: :orders  

  before_create :generate_api_key

  protected

  def generate_api_key
    self.api_key = loop do
      api_key = SecureRandom.urlsafe_base64(nil, false)
      break api_key unless Customer.exists?(api_key: api_key)
    end
  end
end
