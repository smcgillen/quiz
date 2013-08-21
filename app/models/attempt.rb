# == Schema Information
#
# Table name: attempts
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  answer_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Attempt < ActiveRecord::Base

attr_accessible :user_id, :answer_id

belongs_to :user
belongs_to :answer


end
