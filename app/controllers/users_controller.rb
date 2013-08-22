class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def index
		@users = User.all
	end

	def create
		User.create(params[:user])
		@users = User.order(:email)
		respond_to do |format|
		format.js { render :create }
		end
	end
end