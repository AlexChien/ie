class UsersController < ApplicationController
  before_filter :login_required,:only=>[:index]

  access_control do
    allow :admin
    action :new, :check_un, :check_email, :create, :forgot_password, :forgot, :reset_password, :reset do
      allow all
    end
  end

  def index
    @users = User.paginate(:all,:per_page=>20,:page => params[:page], :order => 'users.created_at DESC')
  end

  def new
    @user = User.new
  end

  def check_un
    user = User.find_by_login(params[:user][:login])
    json = "#{user.nil?}"

    respond_to do |wants|
      wants.js { render :text => json }
    end
  end

  def check_email
    user = User.find_by_email(params[:user][:email])
    json = "#{user.nil?}"

    respond_to do |wants|
      wants.json { render :text => json }
    end
  end

  def create
    logout_keeping_session!
    @user = User.new(params[:user])

    success = @user && @user.save

    if success && @user.errors.empty?

      # Protects against session fixation attacks, causes request forgery
      # protection if visitor resubmits an earlier form using back
      # button. Uncomment if you understand the tradeoffs.
      # reset session
      self.current_user = @user # !! now logged in
      redirect_back_or_default('/')
      flash[:notice] = "注册成功"
    else
#      flash[:error]  = "We couldn't set up that account, sorry.  Please try again, or contact an admin (link is above)."
      render :action => 'new'
    end
  end

  def forgot_password
  end

  def forgot
    @user = User.first(:conditions=>["login = ? or email = ?",params[:login_or_email].downcase,params[:login_or_email]])
    if @user
      @user.forgot_password!
      flash[:notice] = '密码重置链接已发送至您的电子邮件.'
      redirect_to login_path
    else
      flash[:error] = '没有找到匹配该用户名或者电子邮件的帐户。'
      redirect_to "/forgot_password"
    end
  end

  def reset_password
    @user = User.find_by_password_reset_code(params[:password_reset_code]) unless params[:password_reset_code].blank?
    if @user
      flash[:notice]  = '请重置你的密码。'
    else
      flash[:error]  = '对不起，您的密码重置码不正确，请检查后重试。'
      redirect_to "/forgot_password"
    end
  end

  def reset
    @user = User.find_by_password_reset_code(params[:password_reset_code]) unless params[:password_reset_code].blank?
    if @user
      if (params[:password] == params[:password_confirmation]) && !params[:password_confirmation].blank?
        @user.password_confirmation = params[:password_confirmation]
        @user.password = params[:password]
        @user.password_reset_code = nil
        if @user.save
          flash[:notice] = '您的密码已经更新，请尝试登陆。'
          redirect_to login_path
        else
          flash[:error] = '对不起，您的密码必须是6位字母。'
          redirect_to "/reset_password/#{params[:password_reset_code]}"
        end
      else
        flash[:error] = '两次输入的密码不相同，请重试。'
        redirect_to "/reset_password/#{params[:password_reset_code]}"
      end
    else
      flash[:error]  = '对不起，您的密码重置码不正确，请检查后重试。'
      redirect_to "/forgot_password"
    end
  end

  def edit_role
    @user = User.find(params[:id])
  end

  def update_role
    @user = User.find(params[:id])
    role = Role.find(params[:roles])
    @user.roles.delete_all
    @user.roles << role
    flash[:notice] = "权限修改成功"
    redirect_to users_path
  end

end
