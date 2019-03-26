class User < ActiveRecord::Base

    has_secure_password
    has_many :reviews

    validates_presence_of :name, :email, :password, :password_confirmation
    validates :email, uniqueness: { case_sensitive: false }
    validates :password, length: { minimum: 6 }

    def self.authenticate_with_credentials(email, password)
        user = User.find_by_email(email.downcase.strip)
        if user && user.authenticate(password)
          user
        else
          nil
        end
      end

end
