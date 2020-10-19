# append question to test with answers
def create_question(test, question_params, *answer_params)
  question = Question.new(question_params.merge(test: test))
  answer_params.each do |params|
    answer = Answer.new(params)
    question.answers << answer
  end

  question.save
  question.answers.each(&:save)

  question
end

user = User.create(first_name: "Teresa", last_name: "Doe", type: "Admin", email: "teresadoe@example.com")

# Категория Культура
category = Category.create(name: "Культура")

## Известные личности
test = Test.create(title: "Известные личности", level: 2, category: category, author: user)
create_question test,
  { body: "Год рождения А. В. Суворова?" },
  { body: "1730", correct: true },
  { body: "1830", correct: false }

create_question test,
  { body: "Первый роман Ф. М. Достоевского?" },
  { body: "Бедные люди", correct: true },
  { body: "Страшные люди", correct: false }


# Категория Программирование
category = Category.create(name: "Программирование")

## Javascript
test = Test.create(title: "Javascript", level: 1, category: category, author: user)

create_question test,
  { body: "Является ли Array типом данных?" },
  { body: "Нет", correct: true },
  { body: "Да", correct: false }

create_question test,
  { body: "Позволяет ли объявление переменной словом const её изменение?" },
  { body: "Нет", correct: true },
  { body: "Да", correct: false }


## Haskell
test = Test.create(title: "Haskell", level: 2, category: category, author: user)

create_question test,
  { body: "Какой тип свёртки позволяет обрабатывать бесконечные списки?" },
  { body: "foldr", correct: true },
  { body: "foldl", correct: false }

create_question test,
  { body: "Какова максимальная арность функций?" },
  { body: "1", correct: true },
  { body: "2", correct: false }
