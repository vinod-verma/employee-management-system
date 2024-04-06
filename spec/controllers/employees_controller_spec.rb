require 'rails_helper'

RSpec.describe EmployeesController, type: :controller do

  let(:admin) { User.create(email: 'admin@example.com', password: "password") }
  before(:each) do
    sign_in admin
  end

  let(:valid_attributes) do
    { first_name: 'John', last_name: 'Doe', email: 'john@example.com', department: 'IT', salary: 50000 }
  end

  let(:invalid_attributes) do
    { first_name: '', last_name: '', email: '', department: '', salary: nil }
  end

  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Employee" do
        expect {
          post :create, params: { employee: valid_attributes }
        }.to change(Employee, :count).by(1)
      end

      it "redirects to the created employee" do
        post :create, params: { employee: valid_attributes }
        expect(response).to redirect_to(employees_path(Employee.last))
      end
    end
  end

  describe "GET #edit" do
    let(:employee) { Employee.create! valid_attributes }

    it "returns a success response" do
      get :edit, params: { id: employee.to_param }
      expect(response).to be_successful
    end
  end

  describe "PUT #update" do
    let(:employee) { Employee.create! valid_attributes }

    context "with valid params" do
      let(:new_attributes) do
        { first_name: 'Jane' }
      end

      it "updates the requested employee" do
        put :update, params: { id: employee.to_param, employee: new_attributes }
        employee.reload
        expect(employee.first_name).to eq('Jane')
      end

      it "redirects to the employee" do
        put :update, params: { id: employee.to_param, employee: valid_attributes }
        expect(response).to redirect_to(employees_path(employee))
      end
    end
  end

  describe "DELETE #destroy" do
    let!(:employee) { Employee.create! valid_attributes }

    it "destroys the requested employee" do
      expect {
        delete :destroy, params: { id: employee.to_param }
      }.to change(Employee, :count).by(-1)
    end

    it "redirects to the employees list" do
      delete :destroy, params: { id: employee.to_param }
      expect(response).to redirect_to(employees_path)
    end
  end
end
