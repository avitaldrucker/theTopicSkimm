class State < ActiveRecord::Base
  validates :name, :nation, presence: true
  validates :name, uniqueness: { scope: :nation }

  has_many :cities
  belongs_to :nation

  has_one :capital, as: :capitable
end
