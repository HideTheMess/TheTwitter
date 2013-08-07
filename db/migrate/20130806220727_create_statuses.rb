class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.string     :tweet, :limit => 140
      t.integer    :user_id
      t.timestamps
    end
  end
end
