class RemoveCreditCardFromTransactions < ActiveRecord::Migration[5.2]
  def change
    def change
      remove_column :transactions, :credit_card_number
      add_column :transactions, :credit_card_number, :bigint
    end
  end
end
