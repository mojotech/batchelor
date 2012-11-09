module BatchesExtension
  def find_in_batches(opts={})
    return unless block_given?
    num_offset = 0

    relation = self.order(self.primary_key).limit(opts[:batch_size])
    relation = relation.select(opts[:select]) if opts[:select]
    relation = relation.joins(opts[:joins]) if opts[:joins]

    while (records = relation.offset(num_offset).all).any?
      yield(records)

      num_offset += records.count
    end
  end
end