class CreateOverallAverages < ActiveRecord::Migration[5.2]

  def change
    create_table :overall_averages do |t|
      t.belongs_to :rateable, :polymorphic => true
      t.float :overall_avg, :null => false
      t.timestamps
    end
  end

end

