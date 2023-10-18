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
    if params[:uid]=="kindai" and params[:pass]="sanriko"
      session[:login_uid]=params[:uid]
      redirect_to "/"
    else
      render "login"
    end
  end
end
