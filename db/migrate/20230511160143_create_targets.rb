class CreateTargets < ActiveRecord::Migration[7.0]
  def change
    create_table :targets do |t|
      t.references :topic, null: false, foreign_key: true
      t.string :title, presence: true, null: false
      t.float :radius, presence: true, null: false
      t.float :lat, presence: true, null: false
      t.float :lng, presence: true, null: false

      t.timestamps
    end
  end
end
