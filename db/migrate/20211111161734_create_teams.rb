class CreateTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :teams do |t|
      # t.integer :id
      t.string :name
      t.timestamps
    end
  end
end