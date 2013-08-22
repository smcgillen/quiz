class ExamsController < ApplicationController
  def index
    @exams = Exam.all
    @users = User.all
  end

  def new
    @exam = Exam.new(params[:exam])
    @question = @exam.questions.new(params[:question])
  end

  def create
    @exam = Exam.new(params[:exam])
  end

def show
    @users = User.all
    @exams = Exam.all
    @exam = Exam.find(params[:id])
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