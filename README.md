batchelor
=========

Override find_in_batches and find_each in ActiveRecord decendant classes that do not have an integer primary key as these will not work when using PostgreSQL.