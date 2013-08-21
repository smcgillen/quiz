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

  attr_accessible :topic, :user_id
  has_many :questions
  has_many :answers

  belongs_to :user

end
