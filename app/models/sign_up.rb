class SignUp < ApplicationRecord
    validates :email, presence: true
end
