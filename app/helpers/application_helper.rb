module ApplicationHelper
  def login_nav
    if @auth.present?
      link_to("Logout #{@auth.username}", logout_path, :method => :get, :class => 'btn btn-danger btn-sm')
    else
      link_to('Login', login_path, :class => 'btn btn-success btn-sm')
    end
  end
end