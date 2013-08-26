class ExamsController < ApplicationController
  def index
    @exams = Exam.all
    @users = User.all

  end

  def new
    @exam = Exam.new(params[:exam])

    10.times do
      question = @exam.questions.build
      4.times { question.answers.build}

    end
  end


  def create
    @exam = Exam.new(params[:exam])
    @exam.user_id = @auth.id
    @exam.save
    redirect_to exams_path



  end

def show

    @users = User.all
    @exam = Exam.find(params[:id])
    @questions = @exam.questions
    # @attempts = @answer.attempts
    @attempt = Attempt.new(params[:attempt])
    @exam.user_id = @auth.id
    @attempt.save


end

  def edit
   @exam = Exam.find(params[:id])

  end

  def update
    exam = Exam.find(params[:id])
    exam.update_attributes(params[:exam])
    redirect_to(exam_path)

    attempt = Attempt.new(params[:id])
    attempt.update_attributes(params[:attempt])



  end

  def destroy
    exam = Exam.find(params[:id])
    exam.destroy
    redirect_to(exam_path(current_user))
  end



end