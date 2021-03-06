class SessionsController < ApplicationController

  def create
    user = User.find_by_email(params[:email])
   # If the user exists AND the password entered is correct.
   if user && user.authenticate(params[:password])
     # Save the user id inside the browser cookie. This is how we keep the user
     # logged in when they navigate around our website.
     session[:user_id] = user.id
     redirect_to new_entry_url, notice: "Logged in"
   else flash.now[:alert] = "Invalid email or password"
   # If user's login doesn't work, send them back to the login form.
     render "new"
   end
  end

  def new
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged out"
  end

end
