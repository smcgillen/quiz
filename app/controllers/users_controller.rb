class UsersController < ApplicationController
  before_filter :check_if_logged_in, :except => [:new, :create]
  # before_filter :check_if_admin, :only => [:destroy]


	def new
		@user = User.new
	end

  def show
    @user = User.find(params[:id])
    @exams = @user.exams
    # @exam = Exam.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

	def index
		@users = User.all
	end

	def create
		@user = User.new(params[:user])

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

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private
  def check_if_logged_in
    redirect_to(login_path) if @auth.nil?
  end

  def check_if_admin
    redirect_to(root_path) if @auth.nil? || !@auth.is_admin?
  end
end
