class CreateDistances < ActiveRecord::Migration[6.0]
  def change
    create_table :distances do |t|
      t.string :origin
      t.string :destination
      t.float :extension

      t.timestamps
    end
  end
end
