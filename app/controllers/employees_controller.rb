class EmployeesController < ApplicationController
  before_action :authenticate_user!
  before_action :get_employee, only: %i[ edit update destroy ]

  def index
    @employees = params[:department].present? ? Employee.where(department: params[:department]) : Employee.all
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(emp_params)

    if @employee.save
      redirect_to employees_path(@employee), notice: "Employee successfully added"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @employee.update(emp_params)
      redirect_to employees_path(@employee), notice: "Employee successfully updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @employee.destroy
    redirect_to employees_path, notice: "Employee was successfully destroyed."
  end

  private

  def emp_params
    params.require(:employee).permit(:first_name, :last_name, :email, :department, :salary)
  end

  def get_employee
    @employee = Employee.find params[:id]
    redirect_to employees_path unless @employee
  end
end