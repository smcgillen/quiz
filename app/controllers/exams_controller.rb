class ExamsController < ApplicationController
  def index
    @exams = Exam.all
    @users = User.all
  end

  def new
    @exam = Exam.new(params[:exam])
    # @question = @exam.questions.new(params[:question])
    # @answer = @question.answers.new(params[:answer])
    # 10.times { @exam.questions.build }

    10.times do
      question = @exam.questions.build
      # answer = question.answers.build
      4.times { question.answers.build}

    end
  end


  def create
    @exam = Exam.new(params[:exam])
    @exam.user_id = @auth.id
    @exam.save
    redirect_to exams_path
    @attempt = Attempt.new(params[:attempt])
    @attempt.save


  end

def show
    @users = User.all
    @exam = Exam.find(params[:id])
    @questions = @exam.questions
    @attempt = Attempt.new(params[:attempt])

    # @answer = Answer.find(params[:id])

    # @current_question = Exam.question.find(params[:id])
end

  def edit
   @exam = Exam.find(params[:id])

  end

  def update
    exam = Exam.find(params[:id])
    exam.update_attributes(params[:exam])
    redirect_to(exam_path)
  end

  def destroy
    exam = Exam.find(params[:id])
    exam.destroy
    redirect_to(exam_path(current_user))
  end



end