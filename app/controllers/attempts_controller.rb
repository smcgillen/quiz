class AttemptsController < ApplicationController
  def index
  end
def create
     @attempt = Attempt.new(params[:attempt])
      @attempt.save

    respond_to do |format|
    format.html { redirect_to(users_path) }
    format.js
  end

  end

  def update


    @attempt = Attempt.new(params[:attempt])
    @attempt.user_id = @auth.id
    @attempt.save
    render :json => @attempt
  end



  def show
    @attempt = Attempt.new(params[:attempt])
  end
end

#    def create
#     @attempt = Attempt.new(params[:attempt])
#     @attempt.save
#   end

#   def show
#     @attempt = Attempt.new(params[:attempt])
#     @attempt.save

# end

#   def edit
#    @exam = Exam.find(params[:id])

#   end

#   def update
#     attempt = Attempt.find(params[:id])
#     attempt.update_attributes(params[:attempt])

#   end
# end