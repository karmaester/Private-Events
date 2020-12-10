class AddCreatorToEvents < ActiveRecord::Migration[6.0]
  def change
    add_reference :events, :user, null: false, foreign_key: 'creator_id'
  end
end
