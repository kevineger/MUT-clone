class CreateTesticles < ActiveRecord::Migration
  def change
    create_table :testicles do |t|
      t.string :size

      t.timestamps
    end
  end
end
