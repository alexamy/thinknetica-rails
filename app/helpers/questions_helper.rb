module QuestionsHelper
  def form_header
    case action_name
    when 'new'
      'Создание нового вопроса'
    when 'edit'
      'Редактирование вопроса'
    else
      raise 'Unknown action'
    end
  end
end
