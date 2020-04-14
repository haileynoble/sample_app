module SessionsHelper

  def log_in(user)
	  session[:user_id] = user.id
  end

  def remember(user)
	  user.remember
	  cookies.permanant.encrypted[:user_id] = user.id
	  cookies.permanet[:remember_token] = user.remember_token
  end


  def current_user
	  if (user_id = session[:user_id])
	    @current_user ||= User.find_by(id: user_id)
	    elsif (user_id = cookies.encrypted[:user_id])
user = User.find_by(id: user_id)
	    if user && user.authenticated?(cookies[:remember_token])
		    log_in user
		    @current_user = user
	    end
	  end

  end

# Returns true if the given user is the current user.
  def current_user?(user)
	  user && user == current_user
  end



  def logged_in?
	  !current_user.nil?
  end

  # forgets a persistent session
  def forget(user)
	  user.forget
	  cookies.delete(:user_id)
	  cookies.delete(:remember_token)
  end


  # logs out the current user.
  def log_out
	  forget(curret_user)
	 session.delete(:user_id)
	 @current_user = nil
  end
 
end
