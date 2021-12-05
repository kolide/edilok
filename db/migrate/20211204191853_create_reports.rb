class CreateReports < ActiveRecord::Migration[7.0]
  def change
    create_table :reports do |t|
      t.text :name
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
