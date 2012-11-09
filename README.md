Batchelor
=========

Override find\_in\_batches and find\_each in ActiveRecord decendant classes that do not have an integer primary key as these will not work when using PostgreSQL.

Usage
=====

Very simply run `gem install batchelor` or include `gem 'batchelor'` in your app's `Gemfile`. Then if you have a class that has a non-integer primary key, just add `extend Batchelor` to the class definition and you can use `find_in_batches` and `find_each` by extension.

Caveats
=======

I have been told that the reason this is **not** in Rails is because `find_in_batches` and `find_each` are expected to process any new records that are created while the block is running. This will happen for incrementing integer primary keys but is not guaranteed for strings. This is just to give you a convenient and query efficient way to iterate over all records of a model with a non integer primary key.

Sqlite (and maybe other databases) will actually let you use the `>=` operator on strings so this gem isn't necessary when using it.

Credits
==========

[![MojoTech](http://www.mojotech.com/press/logo.png)](http://www.mojotech.com)

License
==========

Batchelor is Copyright © 2012 MojoTech, LLC. and is released under the MIT license.