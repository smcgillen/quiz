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

attr_accessible :exam_id, :question

belongs_to :exam
has_many :answers

# def answer
#    uncorrect
#    choices.select {|c| c.correct}[0]
#   end

#   def uncorrect
#    choices.each {|c| c.correct = false}
#   end

#   def answer= choice
#    if !answer.nil?
#     answer.correct = false
#    end

#    if choices.include? choice
#     choice.correct = true
#    else
#     choices << choice
#     choice.correct = true
#    end
#   end

end
