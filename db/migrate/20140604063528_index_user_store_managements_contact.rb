class IndexUserStoreManagementsContact < ActiveRecord::Migration


def up
  execute "CREATE INDEX user_store_managements_contact ON user_store_managements USING GIN(contact)"
  execute "CREATE INDEX user_store_managements_orders ON user_store_managements USING GIN(orders)"
  execute "CREATE INDEX user_store_managements_invoice ON user_store_managements USING GIN(invoice)"
  execute "CREATE INDEX user_store_managements_commission ON user_store_managements USING GIN(commission)"
  execute "CREATE INDEX user_store_managements_user_rep ON user_store_managements USING GIN(user_rep)"
end

def down
  execute "DROP INDEX user_store_managements_contact"
  execute "DROP INDEX user_store_managements_order"
  execute "DROP INDEX user_store_managements_invoice"
  execute "DROP INDEX user_store_managements_commission"
  execute "DROP INDEX user_store_managements_user_rep"
end


end
