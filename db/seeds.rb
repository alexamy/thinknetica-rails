# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

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

# Пользователи
User.create(name: "Jonh Doe", email: "johndoe@example.com", user_type: "student", password_digest: "md5test1")
User.create(name: "Mike Doe", email: "mikedoe@example.com", user_type: "student", password_digest: "md5test2")

user = User.create(name: "Teresa Doe", email: "teresadoe@example.com", user_type: "teacher", password_digest: "md5test3")

# Категория Культура
category = Category.create(name: "Культура")

## Известные личности
test = Test.create(title: "Известные личности", level: 2, category: category, author: user)
create_question test,
  { body: "Год рождения А. В. Суворова?" },
  { body: "1730", correct: true }

create_question test,
  { body: "Первый роман Ф. М. Достоевского?" },
  { body: "Бедные люди", correct: true }


# Категория Программирование
category = Category.create(name: "Программирование")

## Javascript
test = Test.create(title: "Javascript", level: 1, category: category, author: user)

create_question test,
  { body: "Является ли Array типом данных?" },
  { body: "Нет", correct: true }

create_question test,
  { body: "Позволяет ли объявление переменной словом const её изменение?" },
  { body: "Нет", correct: true }


## Haskell
test = Test.create(title: "Haskell", level: 2, category: category, author: user)

create_question test,
  { body: "Какой тип свёртки позволяет обрабатывать бесконечные списки?" },
  { body: "foldr", correct: true }

create_question test,
  { body: "Какова максимальная арность функций?" },
  { body: "1", correct: true }
