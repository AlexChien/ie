# encoding: utf-8
require 'digest/sha1'

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  acts_as_authorization_subject

  include Authentication
  include Authentication::ByPassword
  include Authentication::ByCookieToken

  has_many :xsvips
  has_many :orders
  has_many :order_line_items
  has_and_belongs_to_many :roles

  validates_presence_of     :login, :name, :email
  validates_uniqueness_of   :login, :email

  validates_length_of       :login, :within => 3..15
  validates_format_of       :login, :with => /^[A-Za-z0-9_-]+$/, :messsage => "请使用英文字母和数字"
#  validates_format_of       :login,    :with => Authentication.login_regex, :message => Authentication.bad_login_message

#  validates_format_of       :name,     :with => Authentication.name_regex,  :message => Authentication.bad_name_message, :allow_nil => true
  validates_length_of       :name,     :within => 2..20

  validates_length_of       :email,    :within => 6..50 #r@a.wk
  validates_format_of       :email,    :with => Authentication.email_regex, :message => "您的电子邮箱格式输入不正确"

  validates_presence_of :password, :if => :password_required?
  validates_presence_of :password_confirmation, :if => :password_required?
  validates_length_of :password, :within => 6..40, :if => :password_required?
  validates_confirmation_of :password, :if => :password_required?

  # HACK HACK HACK -- how to do attr_accessible from here?
  # prevents a user from submitting a crafted form that bypasses activation
  # anything else you want your user to change should be added here.
  attr_accessible :login, :email, :name, :password, :password_confirmation, :mobile

  after_create :add_role


  # Authenticates a user by their login name and unencrypted password.  Returns the user or nil.
  #
  # uff.  this is really an authorization, not authentication routine.
  # We really need a Dispatch Chain here or something.
  # This will also let us return a human error message.
  #
  def self.authenticate(login, password)
    return nil if login.blank? || password.blank?
    u = first(:conditions=>["login = ? or email = ?",login.downcase,login]) # need to get the salt
    u && u.authenticated?(password) ? u : nil
  end

  def login=(value)
    write_attribute :login, (value ? value.downcase : nil)
  end

  def email=(value)
    write_attribute :email, (value ? value.downcase : nil)
  end

  def forgot_password!
    self.password_reset_code = Digest::SHA1.hexdigest( Time.now.to_s.split(//).sort_by {rand}.join )
    self.save
    UserMailer.deliver_forgot_password(self)
  end

  def role_names(join="<br/>")
    arr = []
    self.roles.each do |role|
      arr << role.name
    end
    arr.join("#{join}")
  end

protected

  def add_role
    self.roles << Role.find_by_name("member")
  end

end
