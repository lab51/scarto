class User < ActiveRecord::Base
  has_many :ads
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                     format: { with: VALID_EMAIL_REGEX, :message => "adres email nie jest poprawny" },
                     uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6, :message => "Hasło powinno mieć minimum 6 znaków." }
  has_secure_password
end
