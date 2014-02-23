class Enterprise < ActiveRecord::Base
  has_many :hosts
  validates_presence_of :name, :created_at
end
