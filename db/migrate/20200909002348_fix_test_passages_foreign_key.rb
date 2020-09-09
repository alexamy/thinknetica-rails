class FixTestPassagesForeignKey < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :test_passages, :current_questions
    add_foreign_key :test_passages, :questions, column: :current_question_id
  end
end
