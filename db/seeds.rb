# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



# Категория Культура
category = Category.create(name: "Культура")

## Известные личности
test = Test.create(title: "Известные личности", level: 2, category: category)

question = Question.create(body: "Год рождения А. В. Суворова?", test: test)
Answer.create(body: "1730", correct: true, question: question)

question = Question.create(body: "Первый роман Ф. М. Достоевского?", test: test)
Answer.create(body: "Бедные люди", correct: true, question: question)



# Категория Программирование
category = Category.create(name: "Программирование")

## Javascript
test = Test.create(title: "Javascript", level: 1, category: category)

question = Question.create(body: "Является ли Array типом данных?", test: test)
Answer.create(body: "Нет", correct: true, question: question)

question = Question.create(body: "Позволяет ли объявление переменной словом const её изменение?", test: test)
Answer.create(body: "Нет", correct: true, question: question)


## Haskell
test = Test.create(title: "Haskell", level: 2, category: category)

question = Question.create(body: "Какой тип свёртки позволяет обрабатывать бесконечные списки?", test: test)
Answer.create(body: "foldr", correct: true, question: question)

question = Question.create(body: "Какова максимальная арность функций?", test: test)
Answer.create(body: "1", correct: true, question: question)



# Пользователи
User.create(name: "Jonh Doe", email: "johndoe@example.com", user_type: "student", password_digest: "md5test1")
User.create(name: "Mike Doe", email: "mikedoe@example.com", user_type: "student", password_digest: "md5test2")
User.create(name: "Teresa Doe", email: "teresadoe@example.com", user_type: "teacher", password_digest: "md5test3")
