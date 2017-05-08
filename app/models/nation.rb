class Nation < ActiveRecord::Base
  validates :name, presence: true

  has_many :states

  has_many :cities,
    through: :states,
    source: :city

  has_one :capital,
    class_name: 'City',
    foreign_key: :capitable_id,
    primary_key: :id,
    as: :capitable

end
