class Credential < ActiveRecord::Base
  belongs_to :host
  validates_presence_of :key, :secret, :created_at
  validates_uniqueness_of :key
end
