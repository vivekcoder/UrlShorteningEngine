class CreateUrls < ActiveRecord::Migration[5.0]
  def change
    create_table :urls do |t|
    	t.string :original
    	t.string :short
    	t.string :sanitized

      t.timestamps
    end
  end
end
