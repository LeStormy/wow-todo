class User < ApplicationRecord
  has_many :main_acts
  has_many :sessions
end
