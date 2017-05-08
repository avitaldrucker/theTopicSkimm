class City < ActiveRecord::Base
  validates :name, presence: true

  belongs_to :state
  belongs_to :capitable, polymorphic: true

  def self.capitals
    City.where(capitable_type: 'State')
  end
  
end
