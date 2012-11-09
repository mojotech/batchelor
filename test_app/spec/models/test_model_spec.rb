require 'spec_helper'

describe TestModel do
  load_test_models

  context 'BatchesExtender' do
    describe '::find_in_batches' do
      it 'can use find_in_batches' do
        lambda { TestModel.find_in_batches }.should_not raise_exception
      end
    end

    describe '::find_each' do

    end
  end
end
