class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :auth_token, uniqueness: true
  has_many :images, dependent: :destroy
  before_validation :generate_authentication_token!
  after_create :send_registratio_mail

  private
  def send_registratio_mail
    UserMailer.registeration_mail(self,self.password).deliver_later
  end

  def generate_authentication_token!
    begin
      self.auth_token = Devise.friendly_token
    end while self.class.exists?(auth_token: auth_token)
  end
end
