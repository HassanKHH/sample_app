class User < ActiveRecord::Base
    EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :name, presence: true, length: {maximum:100} 
    validates :email, presence: true, length: {maximum:200}, format: {with: EMAIL_REGEX},
                    uniqueness: {case_sensitive: false}
end
