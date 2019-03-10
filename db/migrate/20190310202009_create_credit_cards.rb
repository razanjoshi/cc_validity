class CreateCreditCards < ActiveRecord::Migration[5.1]
  def change
    create_table :credit_cards do |t|
      t.integer :number
      t.string :type
      t.string :validation

      t.timestamps
    end
  end
end
