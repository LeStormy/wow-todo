class SubAct < ApplicationRecord
  belongs_to :main_act
  has_many :completions
end
