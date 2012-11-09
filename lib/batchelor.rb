module Batchelor
  def find_in_batches(opts={})
    return unless block_given?
    batch_size = opts.delete(:batch_size) || 1000
    num_offset = 0

    relation = self.reorder(self.primary_key).limit(batch_size)
    unless opts.empty?
      raise "You can't specify an order, it's forced to be the primary key" if opts[:order].present?
      raise "You can't specify a limit, it's forced to be the batch_size"   if opts[:limit].present?
      raise "You can't specify a start in this implementation"              if opts[:start].present?

      relation = relation.apply_finder_options(opts)
    end

    while (records = relation.offset(num_offset).all).any?
      yield(records)

      num_offset += records.count
    end
  end

  def find_each(opts={})
    return unless block_given?

    find_in_batches(opts) do |records|
      records.each { |record| yield(record) }
    end
  end
end