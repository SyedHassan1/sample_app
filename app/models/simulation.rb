class Simulation < ActiveRecord::Base
  attr_accessible :input, :output

  belongs_to :user

  validates :input, presence: true, length: { maximum: 140}
  validates :user_id, presence: true

  default_scope order: 'simulations.created_at DESC'
end
