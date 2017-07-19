class ContactUs < ApplicationRecord
  validates_presence_of :name, :email,:description ,:mobile_no
  validate :valid_email?,:valid_mobile_no?

  private
  def valid_email?
    unless self.email =~ /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
      self.errors.add(:email, "Invalid email format")
    end
  end

  def valid_mobile_no?
    unless self.mobile_no =~ /((\+*)((0[ -]+)*|(91 )*)(\d{12}+|\d{10}+))|\d{5}([- ]*)\d{6}/
      self.errors.add(:email, "Please! enter valid 10 digit mobile no.")
    end
  end
end
