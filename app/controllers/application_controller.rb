class ApplicationController < ActionController::Base
  before_action :foo, :initialize_cart_session
  helper_method :login, :logout

  def foo
    @user_account = session[:customer_account]
  end

  def login
    session[:customer_account] =
      Customer
      .find_by(email: params[:email])
      &.authenticate(params[:password])
    foo
  end

  def logout
    session[:customer_account] = nil
    foo
    redirect_to "/"
  end

  def initialize_cart_session
    session[:shopping_cart] ||= 0
  end
end
