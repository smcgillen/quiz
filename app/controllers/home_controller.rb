class HomeController < ApplicationController
  def index
      @users = User.all
  end

  def about
  end

  def works
  end

  def contact
  end

  def quizzes
  end
end