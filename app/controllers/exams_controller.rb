class ExamsController < ApplicationController
  def index
    @exams = Exam.all
  end

  def create
    @exam = current_user.exams.new(params[:exam])
    @exam.save
    redirect_to(new_exam_path)
  end

def show
    @users = User.all
    @exams = Exam.all
    @exams = Exam.find(params[:id])
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