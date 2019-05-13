class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      t.string :name
      t.string :start_time
      t.string :end_time
      t.date :date
      t.string :description
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
