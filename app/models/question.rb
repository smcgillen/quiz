# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  question   :string(255)
#  exam_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Question< ActiveRecord::Base

attr_accessible :exam_id, :question, :answers_attributes

belongs_to :exam
has_many :answers

accepts_nested_attributes_for :answers

# def correct_answer
#   if answer.correct = true
# end

# def incorrect_answer
#   if answer.correct = false
# end

# def correct_answer
#    uncorrect
#    answers.select {|c| c.correct}[0]
#   end

#   def uncorrect
#    answers.each {|c| c.correct = false}
#   end

#   def correct_answer= answer
#    if !answer.nil?
#     answer.correct = false
#    end

  #  if answers.include? answer
  #   answer.correct = true
  #  else
  #   answers << answers
  #   answer.correct = true
  #  end
  # end
end
