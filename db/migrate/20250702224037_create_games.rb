class CreateGames < ActiveRecord::Migration[8.0]
  def change
    create_table :games do |t|
      t.string :state, null: false, default: 'new'
      t.references :board, foreign_key: true
      t.timestamps
    end
  end
end
