module TestPassagesHelper
  def questions_size(test_passage)
    test_passage.test.questions.size
  end

  def success_class(test_passage)
    if test_passage.successful?
      :success
    else
      :fail
    end
  end
end
