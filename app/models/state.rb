class State < ActiveRecord::Base
  validates :name, :nation, presence: true
  validates :name, uniqueness: { scope: :nation }

  has_many :cities
  belongs_to :nation

  has_one :capital,
    class_name: 'City',
    foreign_key: :capitable_id,
    primary_key: :id,
    as: :capitable

end
