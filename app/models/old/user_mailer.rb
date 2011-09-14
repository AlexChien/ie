class UserMailer < ActionMailer::Base

  def forgot_password(user)
    setup_email(user)
    @subject     = '您请求了一个新的密码'
  end

  def order_notice(user,order)
    setup_email(user,order)
    @subject     = '星尚画报订单'
  end

protected

  def setup_email(user,order=nil)
    @recipients  = user.email
    @from        = "enjoyoung_mailer@enjoyoung.cn"
    @sent_on     = Time.now
    @body[:user] = user
    @body[:order] = order
  end

end
