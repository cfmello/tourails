class AddActiveToOffers < ActiveRecord::Migration[6.0]
  def change
    add_column :offers, :active, :boolean, default: true
  end
end
