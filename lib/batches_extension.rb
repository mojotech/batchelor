module BatchesExtension
  def find_in_batches
    return unless block_given?

    yield(self.all)
  end
end