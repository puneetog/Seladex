class IndexOrganizationManagementsColumn < ActiveRecord::Migration
  def up
  execute "CREATE INDEX organization_managements_contact ON organization_managements USING GIN(contact)"
  execute "CREATE INDEX organization_managements_orders ON organization_managements USING GIN(orders)"
  execute "CREATE INDEX organization_managements_invoice ON organization_managements USING GIN(invoice)"
  execute "CREATE INDEX organization_managements_commission ON organization_managements USING GIN(commission)"
  execute "CREATE INDEX organization_managements_user_rep ON organization_managements USING GIN(user_rep)"
end

def down
  execute "DROP INDEX organization_managements_contact"
  execute "DROP INDEX organization_managements_order"
  execute "DROP INDEX organization_managements_invoice"
  execute "DROP INDEX organization_managements_commission"
  execute "DROP INDEX organization_managements_user_rep"
end
end
