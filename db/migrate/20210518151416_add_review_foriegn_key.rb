class AddReviewForiegnKey < ActiveRecord::Migration[6.1]
  def change
    add_column :reviews, :user_id, :integer
    add_column :reviews, :game_id, :integer
    add_column :users, :group_id, :integer
    add_column :comments, :review_id, :integer
    add_column :comments, :user_id, :integer
  end
end
