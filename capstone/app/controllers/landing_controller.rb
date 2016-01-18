class LandingController < ApplicationController
  def index
    cookies.delete :user_name
    cookies.delete :user_id
    cookies.delete :user_fname
    cookies.delete :user_date
    cookies.delete :user_email
    cookies.delete :logged_in

  end

  def test
    @message = '.....';
  end
end
