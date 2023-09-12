class User < ApplicationRecord
  include Clearance::User
  has_one :cart
  has_many :reviews
end
