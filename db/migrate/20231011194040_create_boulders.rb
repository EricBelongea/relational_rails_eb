class CreateBoulders < ActiveRecord::Migration[7.0]
  def change
    create_table :boulders do |t|
      t.string :name
      t.integer :v_grade
      t.boolean :tick
      t.references :field, null: false, foreign_key: true

      t.timestamps
    end
  end
end
