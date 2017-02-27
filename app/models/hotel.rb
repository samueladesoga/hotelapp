class Hotel < ApplicationRecord
	validates :name, :email, :contact_person, :address, :phone :presence => true
	validates_format_of :email, :with => /@/
end