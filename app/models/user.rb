class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_one :address, as: :addressable
end
