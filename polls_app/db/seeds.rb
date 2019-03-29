# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
anthony = User.create(username: "waifus")



Poll.destroy_all
a_poll = Poll.create(author_id: anthony.id, title: "waifu wars")


Question.destroy_all
a_question = Question.create(poll_id: a_poll.id, text: "Who is the best waifu?")


AnswerChoice.destroy_all
a_answer = AnswerChoice.create(question_id: a_question.id, text:"Rem best grill")

Response.destroy_all
a_response = Response.create(answer_choice_id: a_answer.id, user_id: anthony.id)
