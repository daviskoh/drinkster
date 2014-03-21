class EditPartsComponents < ActiveRecord::Migration
  def change
    change_column :components, :parts, :integer, default: 1
  end
end
