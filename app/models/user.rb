class User < ActiveRecord::Base
  has_many :favorites
  has_many :feeds, through: :favorites
end
