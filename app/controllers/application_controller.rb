class ApplicationController < ActionController::Base
  before_action(:load_current_user)
  
  # before_action(:force_user_sign_in)

  def index
    if session[:user_id] == nil
      render({ :template => "user_sessions/sign_in.html.erb" })
      
    else
      @flights = Flight.all.order({ :created_at => :desc })

      render({ :template => "flights/index.html.erb" })
    end
  end
  
  def load_current_user
    the_id = session.fetch(:user_id)
    @current_user = User.where({ :id => the_id }).at(0)
  end
  
  def force_user_sign_in
    if @current_user == nil
      redirect_to("/user_sign_in", { :notice => "You have to sign in first." })
    end
  end

end
