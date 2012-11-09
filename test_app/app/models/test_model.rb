class TestModel < ActiveRecord::Base
  extend Batchelor

  self.primary_key = :primary_key
  attr_accessible :primary_key
end
