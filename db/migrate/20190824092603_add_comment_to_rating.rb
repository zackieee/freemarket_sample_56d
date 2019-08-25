class AddCommentToRating < ActiveRecord::Migration[5.2]
  def change
    add_column    :ratings,   :comment,  :text,               after: :rate
    add_reference :ratings,   :trade,    foreign_key: true,   after: :rater_user_id
  end
end