class LoginsController < ApplicationController
  def login
    if session[:login_uid]!=nil
      render "main"
    else
      render "login"
    end
  end
    
  def val
    if params[:rl]=="in"
    if User.find_by(uid: params[:uid])
      b=User.find_by(uid: params[:uid])
      p=BCrypt::Password.new(b.pass)
      if b.pass==p
        session[:login_uid]=params[:uid]
        redirect_to "/"
      else
        render "logins/error"
      end
    else
      render "logins/error"
    end
    elsif params[:rl]=="regi"
      if User.find_by(uid: params[:uid])
        render "logins/error1"
      else
        p=BCrypt::Password.create(params[:pass])
        puts p
        puts "--------------"
        user=User.new(uid: params[:uid],pass: p)
        user.save
        session[:login_uid]=nil
        redirect_to "/"
      end
    else
      render "login"
    end
end
  
  def logout
    session[:login_uid]=nil
    render "login"
  end
end
