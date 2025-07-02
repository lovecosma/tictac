class CreateGames < ActiveRecord::Migration[8.0]
  def change
    create_table :games do |t|
      t.string :state, null: false, default: 'new'
      t.timestamps
    end
  end
end
