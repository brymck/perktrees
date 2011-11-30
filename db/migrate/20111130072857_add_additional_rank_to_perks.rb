class AddAdditionalRankToPerks < ActiveRecord::Migration
  def change
    add_column :perks, :additional_rank, :integer
  end
end
