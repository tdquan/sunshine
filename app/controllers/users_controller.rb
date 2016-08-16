class UsersController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  def dashboard
    if current_user.nil?
      redirect_to new_user_session_path
    end
  end

end
