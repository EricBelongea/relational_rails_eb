class Field < ApplicationRecord
  has_many :boulders

  def boulder_count
    boulders.count
  end
end