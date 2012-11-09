class TestModel < ActiveRecord::Base
  extend BatchesExtension

  self.primary_key = :primary_key
  attr_accessible :primary_key
end
