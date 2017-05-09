class City < ActiveRecord::Base
  validates :name, presence: true

  belongs_to :state
  belongs_to :capitable, polymorphic: true

  has_one :nation,
    through: :state,
    source: :nation

  def self.state_capitals
    City.where(capitable_type: 'State')
  end

end
