class TestModel < ActiveRecord::Base
  self.primary_key = :primary_key
  attr_accessible :primary_key
end
