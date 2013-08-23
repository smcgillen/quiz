# == Schema Information
#
# Table name: exams
#
#  id         :integer          not null, primary key
#  topic      :string(255)
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Exam < ActiveRecord::Base

  attr_accessible :topic, :user_id, :questions_attributes
  has_many :questions, :dependent => :destroy


  accepts_nested_attributes_for :questions
  belongs_to :user

  def current_exam
    current_exam = @auth.exams
  end

  def user_avatar
    user.avatar if user
  end


end
