class LoginController < ApplicationController
  def signin
    login
    @logged_in_user = session[:customer_account]
  end

  def signout
    logout
  end
end
