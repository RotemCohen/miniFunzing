class CreateActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :activities do |t|
      t.string :title
      t.text :description
      t.references :user
      t.integer :max_attendees
      t.datetime :date
      t.float :ticket_cost
    end
  end
end
