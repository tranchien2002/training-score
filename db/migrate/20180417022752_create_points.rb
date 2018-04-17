class CreatePoints < ActiveRecord::Migration[5.1]
  def change
    create_table :points do |t|
      t.integer :point1
      t.integer :point1_monitor
      t.integer :point2
      t.integer :point2_monitor
      t.integer :point3
      t.integer :point3_monitor
      t.boolean :student_verify, default: false
      t.boolean :monitor_verify, default: false
      t.boolean :teacher_verify,   default: false
      t.string  :user_name
      t.text    :message

      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
