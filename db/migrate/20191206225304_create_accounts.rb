class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
    	t.integer :balance
    	t.references :user
    	t.string :name
    	t.string :description
    	t.integer :position
    	t.string :currency
    	t.string :account_type
    	t.boolean :is_disabled
    	t.string :slug
      t.timestamps
    end
  end
end
