module BatchesExtension
  def find_in_batches(opts={})
    return unless block_given?
    num_offset = 0

    relation = self.order(self.primary_key).limit(opts[:batch_size])
    records = relation.all

    while records.any?
      yield(records)

      num_offset += records.count
      records = relation.offset(num_offset).all
    end
  end
end