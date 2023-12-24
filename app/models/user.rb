class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_one :address, as: :addressable

  def name
    "#{self.first_name} #{self.last_name}"
  end
end
