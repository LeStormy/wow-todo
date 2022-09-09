class Session < ApplicationRecord
  belongs_to :user, required: true
end
