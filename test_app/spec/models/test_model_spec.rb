require 'spec_helper'

describe TestModel do
  load_test_models

  context 'BatchesExtender' do
    describe '::find_in_batches' do
      it 'can use find_in_batches' do
        lambda { TestModel.find_in_batches }.should_not raise_exception
      end

      it 'finds records' do
        records_found = false

        TestModel.find_in_batches do |records|
          records_found = true unless records.empty?
        end

        records_found.should be_true
      end

      it 'finds records in batches' do
        num_records = TestModel.count
        num_itterations = 0

        (1..10).each do |batch_size|
          expected_itterations = (num_records.to_f / batch_size).ceil

          TestModel.find_in_batches(:batch_size => batch_size) do |records|
            num_itterations += 1

            expected_count = batch_size
            if num_itterations == expected_itterations
              last_count = num_records % batch_size
              expected_count = last_count unless last_count.zero?
            end

            records.count.should == expected_count
          end

          num_itterations.should == expected_itterations
          num_itterations = 0
        end
      end
    end

    describe '::find_each' do

    end
  end
end
