require 'mongoid'

Mongoid.load! "config/mongoid.config"

class Task
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :description, type: String

  validates :name, presence: true
  validates :description, presence: true
end
