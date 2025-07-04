class CreateBoards < ActiveRecord::Migration[8.0]
  def change
    create_table :boards do |t|
      t.string :spaces, array: true
      t.timestamps
    end
  end
end
