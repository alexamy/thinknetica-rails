module TestPassagesHelper
  def current_question_index(test_passage)
    test_passage.test.questions.ids.index(test_passage.current_question.id) + 1
  end

  def questions_size(test_passage)
    test_passage.test.questions.size
  end
end
