class Student < ActiveRecord::Base
	validates :name, presence: true, length: 3..120
	validates :marks, presence: true
end
