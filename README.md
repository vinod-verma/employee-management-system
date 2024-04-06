## About
    This is a Employee Management System project with ability to import employee data from an external API and process it in the background.

#### Features

    - Implemented dashboard to manage employees 
    - Implemented API to generate list of employees that returns JSON data
    - Implemented background job using Sidekiq to to import employee data from external API and create employess
    - Added tests using RSpec.

#### Prerequisites

- ruby 3.2.2
- rails 7.0.8
- Node 18+, and Yarn 1.x

#### Install

##### 1. Check out the repository

```bash
git clone https://github.com/ravendra-01/employee-management-system.git
```

##### 2. Create and setup the database

Run the following commands to install gems.

```ruby
bundle install
```

##### 3. Create and setup the database

Run the following commands to create and setup the database.

```ruby
rails db:create db:migrate db:seed
```

##### 4. Create and setup the database

Run the following commands to create and setup the database.

```ruby
rails assets:precompile
```

##### 5. Start the Rails server

You can start the rails server using the command given below.

```ruby
rails s
```
##### 6. To Run Background Jobs

start redis server and then run

```ruby
bundle exec sidekiq
```

And now you can visit the site with the URL http://localhost:3000

API to generate list of employees: http://localhost:3000/generate_emp_detail 

