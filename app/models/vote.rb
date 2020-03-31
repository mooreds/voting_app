class Vote < ApplicationRecord
  belongs_to :voter
  belongs_to :candidate
  validates :voter, uniqueness: true
end
