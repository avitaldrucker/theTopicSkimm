class Nation < ActiveRecord::Base
  validates :name, presence: true

  has_many :states

  has_many :cities,
    through: :states,
    source: :city

  has_one :capital, as: :capitable
end
