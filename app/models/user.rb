class User < ActiveRecord::Base
  attr_accessible :full_name, :email, :username, :password

  validates_presence_of :full_name
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, :presence   => true, 
                    :format     => { :with => email_regex },
                    :uniqueness => { :case_sensitive => false }
  validates_length_of :username, :minimum => 2, :maximum => 32, :allow_blank => true
end