# == Schema Information
#
# Table name: answers
#
#  id          :integer          not null, primary key
#  description :string(255)
#  correct     :boolean          default(FALSE)
#  question_id :integer
#  exam_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Answer < ActiveRecord::Base

attr_accessible :description, :correct, :question_id, :exam_id

belongs_to :question
belongs_to :exam

end
