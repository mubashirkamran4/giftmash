class AddUpvotesAndDownvotesToGift < ActiveRecord::Migration[7.2]
  def change
    add_column :gifts, :upvotes, :integer, default: 0
    add_column :gifts, :downvotes, :integer, default: 0
  end
end
