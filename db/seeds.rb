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

user = User.new(
  first_name: "John",
  last_name: "Doe",
  type: "Admin",
  email: "alexamy.test.guru@gmail.com",
  password: ENV['ADMIN_PASS'],
  password_confirmation: ENV['ADMIN_PASS']
)
user.skip_confirmation!
user.save!

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
test = Test.create(title: "Haskell", level: 2, completion_time: 1, category: category, author: user)

create_question test,
  { body: "Какой тип свёртки позволяет обрабатывать бесконечные списки?" },
  { body: "foldr", correct: true },
  { body: "foldl", correct: false }

create_question test,
  { body: "Какова максимальная арность функций?" },
  { body: "1", correct: true },
  { body: "2", correct: false }

# badges
Badge.create(name: 'За тесты 1го уровня', filename: '002-trophy', level: 1)
Badge.create(name: 'За тесты категории "Программирование"',
             filename: '020-badge',
             category: Category.where(name: 'Программирование').first)
