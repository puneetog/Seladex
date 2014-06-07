class AddIndexToRole < ActiveRecord::Migration
def up
  execute "CREATE INDEX roles_contact ON roles USING GIN(contact)"
  execute "CREATE INDEX roles_orders ON roles USING GIN(orders)"
  execute "CREATE INDEX roles_invoice ON roles USING GIN(invoice)"
  execute "CREATE INDEX roles_commission ON roles USING GIN(commission)"
  execute "CREATE INDEX roles_user_rep ON roles USING GIN(user_rep)"
end

def down
  execute "DROP INDEX roles_contact"
  execute "DROP INDEX roles_orders"
  execute "DROP INDEX roles_invoice"
  execute "DROP INDEX roles_commission"
  execute "DROP INDEX roles_user_rep"
end
end
