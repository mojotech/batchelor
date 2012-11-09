Gem::Specification.new do |s|
  s.name        = 'batches_extension'
  s.version     = '1.0.0'
  s.date        = '2012-11-09'
  s.summary     = 'Override find_in_batches and find_each in ActiveRecord decendant classes that do not have an integer primary key'
  s.description = <<-DESC
    Override find_in_batches and find_each in ActiveRecord decendant classes that do not have an integer primary key
    as these will not work when using PostgrSQL.
  DESC
  s.authors     = ['Aaron Rosenberg']
  s.email       = 'aarongrosenberg@gmail.com'
  s.files       = ['lib/batches_extension.rb']
  s.homepage    = 'https://github.com/LtCmdDudefellah/batches_extension'
end
