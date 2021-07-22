# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create!([{ name: 'Леонардо', email: 'leo@mail.ru' }, { name: 'Донателло', email: 'don@mail.ru' },
                      { name: 'Микеланджело', email: 'mike@mail.ru' }, { name: 'Рафаэль', email: 'raf@mail.ru' }])

categories = Category.create!([{ title: 'Категория №1' }, { title: 'Категория №2' }])

tests = Test.create!([{ title: 'Тест №1', level: 0, category_id: categories[0].id, author_id: users[0].id },
                      { title: 'Тест №2', level: 1, category_id: categories[0].id, author_id: users[1].id },
                      { title: 'Тест №3', level: 2, category_id: categories[1].id, author_id: users[2].id },
                      { title: 'Тест №4', level: 3, category_id: categories[1].id, author_id: users[3].id }])

questions = Question.create!([{ title: 'Вопрос первого теста', test_id: tests[0].id },
                              { title: 'Вопрос второго теста', test_id: tests[1].id },
                              { title: 'Вопрос третьего теста', test_id: tests[2].id },
                              { title: 'Вопрос четвертого теста', test_id: tests[3].id }])

Answer.create!([{ title: 'Правильный ответ', correct: true, question_id: questions[0].id },
                { title: 'Неправильный ответ', correct: false, question_id: questions[0].id },
                { title: 'Правильный ответ', correct: true, question_id: questions[1].id },
                { title: 'Неправильный ответ', correct: false, question_id: questions[1].id },
                { title: 'Правильный ответ', correct: true, question_id: questions[2].id },
                { title: 'Неправильный ответ', correct: false, question_id: questions[2].id },
                { title: 'Правильный ответ', correct: true, question_id: questions[3].id },
                { title: 'Неправильный ответ', correct: false, question_id: questions[3].id }])
