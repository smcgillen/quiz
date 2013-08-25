scores = []
user.exams.each do |exam|
  score = Score.new
  score.exam_id = exam.id
  score.user_id = user.id
  score.fetch_scores

  scores.push(score)
end

render :json => scores

class Score
  attr_accessible :exam_id, :user_id, :scores

  scores = nil

  def fetch_scores
  @user.attempts each.do |answer|
    for :correct?
      correct = 10
      correct * 10
    end
    # Updates `scores` array with tricky database lookups
  end

end


# [
# xkeys: 'scores'
# ykey exam:topic
# ]

