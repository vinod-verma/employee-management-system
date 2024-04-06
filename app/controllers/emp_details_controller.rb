class EmpDetailsController < ApplicationController
  protect_from_forgery unless: -> { request.format.json? }

  def generate_emp_detail
    employees_list = []
    10.times {
      employees_list << { 
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        email: Faker::Internet.email,
        department: Faker::Commerce.department(max: 1),
        salary: Faker::Number.between(from: 30000, to: 100000)
      }
    }
    render json: { results: employees_list }, status: :ok
  end    
end