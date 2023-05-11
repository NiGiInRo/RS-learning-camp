class CreateTargets < ActiveRecord::Migration[7.0]
  def change
    create_table :targets do |t|
      t.references :topic, null: false, foreign_key: true
      t.string :tittle
      t.float :radius
      t.float :lat
      t.float :lng

      t.timestamps
    end
  end
end
