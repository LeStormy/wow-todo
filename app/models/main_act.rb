class MainAct < ApplicationRecord
  belongs_to :user
  has_many :sub_acts
end
