require 'sidekiq-scheduler'
require 'net/http'

class CreateEmployeeWorker
  include Sidekiq::Worker
  
  def perform
    url = 'http://localhost:3000/generate_emp_detail'
    resp = Net::HTTP.get_response(URI.parse(url))
    data = JSON.parse(resp.body)
    data['results'].each do |api_user|
      employee = Employee.find_or_initialize_by(
              email: api_user['email'],
              first_name: api_user['first_name'],
              last_name: api_user['last_name'],
              department: api_user['department'],
              salary:api_user['salary']
      )
      employee.save
    end
  end
end