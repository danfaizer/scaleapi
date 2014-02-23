class Host < ActiveRecord::Base
  has_many :credentials
  belongs_to :enterprise
  validates_presence_of :uuid, :name, :created_at
  validates_uniqueness_of :uuid
end

