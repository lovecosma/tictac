class CreateBoards < ActiveRecord::Migration[8.0]
  def change
    create_table :boards do |t|
      t.string :cells, array: true, default: Array.new(9, '')
      t.timestamps
    end
  end
end
