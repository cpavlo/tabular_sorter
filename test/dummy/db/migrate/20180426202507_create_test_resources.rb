class CreateTestResources < ActiveRecord::Migration[5.1]
  def change
    create_table :test_resources do |t|
      t.string :name
      t.integer :age
      t.string :kind

      t.timestamps
    end
  end
end
