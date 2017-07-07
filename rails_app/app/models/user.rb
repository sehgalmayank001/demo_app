class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :send_registratio_mail
  has_many :images

  private
  def send_registratio_mail
    UserMailer.registeration_mail(self).deliver!
  end
end
