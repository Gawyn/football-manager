class SessionsController < ApplicationController
  def create
    omniauth = request.env["omniauth.auth"]
    info = omniauth['info']

    user = User.find_by(email: info['email'])

    unless user
      user = User.create(name: info['nickname'], email: info['email'])
    end

    session[:user_id] = user.id

    url_path = user.team ? team_path : new_team_path
    redirect_to url_path
  end

  def destroy
    reset_session
    redirect_to root_path
  end

  def failure
    redirect_to root_path
  end
end
