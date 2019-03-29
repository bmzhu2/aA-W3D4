# == Schema Information
#
# Table name: responses
#
#  id               :bigint(8)        not null, primary key
#  user_id          :integer
#  answer_choice_id :integer
#

class Response < ApplicationRecord
  belongs_to(:answer_choice,
    primary_key: :id,
    foreign_key: :answer_choice_id,
    class_name: :AnswerChoice
  )

  belongs_to(:respondent,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User
  )

  has_one(:question,
    through: :answer_choice,
    source: :question
  )

  def sibling_responses
    self.question.responses.where.not(id: self.id)
  end

  def respondent_already_answered?
    if sibling_responses.exists?(user_id: self.user_id)
      true
    else
      false
    end
  end
end
