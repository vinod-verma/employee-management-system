class Employee < ApplicationRecord
  validates :first_name, :last_name, :department, :salary, presence: :true
  validates :email, presence: :true, uniqueness: true
end