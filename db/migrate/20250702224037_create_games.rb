class CreateGames < ActiveRecord::Migration[8.0]
  def change
    create_table :games do |t|
      t.string :board, array: true , default: Array.new(9, '')
      t.string :state, null: false, default: 'new'
      t.timestamps
    end
  end
end
