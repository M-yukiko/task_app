class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.string :title
      t.date :start
      t.date :close
      t.boolean :allday
      t.string :memo

      t.timestamps
    end
  end
end
