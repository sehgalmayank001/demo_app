class ContactUs < ApplicationRecord
  validates_presence_of :name, :email,:description ,:mobile_no
end
