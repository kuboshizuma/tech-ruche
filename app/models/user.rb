class User < ActiveRecord::Base
  has_many :favorites, dependent: :delete_all
  has_many :feeds, through: :favorites
end
