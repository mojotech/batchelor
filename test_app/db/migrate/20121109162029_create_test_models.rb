class CreateTestModels < ActiveRecord::Migration
  def change
    create_table :test_models, :id => false do |t|
      t.string :primary_key
    end
  end
end
