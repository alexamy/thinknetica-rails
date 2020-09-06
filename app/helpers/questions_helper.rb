module QuestionsHelper
  def form_header(question)
    if question.new_record?
      'Создание нового вопроса'
    else
      'Редактирование вопроса'
    end
  end
end
