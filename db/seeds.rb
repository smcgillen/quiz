User.destroy_all
Exam.destroy_all
Attempt.destroy_all
Question.destroy_all
Answer.destroy_all

u1 = User.create(:email => 'ryan@gmail.com', :password => '123456', :password_confirmation => '123456', :location => "508 Harris Street, Sydney", :username => "Ryan", )

u2 = User.create(:email => 'tom@gmail.com', :password => '123456', :password_confirmation => '123456', :location => "508 Harris Street, Sydney", :username => "Tom", )
u3 = User.create(:email => 'hui@gmail.com', :password => '123456', :password_confirmation => '123456', :location => "508 Harris Street, Sydney", :username => "Hui", )
u3.is_admin = true
u3.save

e1 = Exam.new(:topic => "Rails" )

q1 = Question.new(:question => 'What is a MVC stand for?')
q1.save

a1 = Answer.new(:description => "Models Versus Cash", :correct => false)
a2 = Answer.new(:description => "Model View Controller", :correct => true)
a3 = Answer.new(:description => "Modify Versus Computers", :correct => false)
a4 = Answer.new(:description => "Money Versus Common Sense", :correct => false)

q1.answers << a1
q1.answers << a2
q1.answers << a3
q1.answers << a4

e1.questions << q1
e1.save

at1 = Attempt.create(:user_id => 1, :answer_id => 1)

u1.attempts <<  at1

u1.exams << e1
u1.save



