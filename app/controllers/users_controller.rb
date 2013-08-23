class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def index
		@users = User.all
		@balance = params[:balance]
	end

	def create
		User.create(params[:user])
		@users = User.order(:email)
		@user = User.new(params[:user])
		# respond_to do |format|
		# 	format.js { render :create }
		respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }

      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
end
		
>>>>>>> 405e57703a2ef9e1dd48c1969570056818ec222c
