class LoginsController < ApplicationController
  def login
    if session[:login_uid]!=nil
      render "main"
    else
      render "login"
    end
  end
    
  def val
    logger.debug  params[:uid]
    if User.find_by(uid: params[:uid]) and User.find_by(pass: params[:pass])
      session[:login_uid]=params[:uid]
      redirect_to "/"
    else
      render "logins/error"
    end
  end
  
  def logout
    session[:login_uid]=nil
    render "login"
  end
end
