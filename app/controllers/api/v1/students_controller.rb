class Api::V1::StudentsController < ApplicationController

  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
  end

  def new
    
  end

  def create
    @student = Student.create(params[:first_name], params[:last_name], params[:original_house])
    redirect_to "/api/v1/students/#{@student.id}"
  end

  def edit
    @student = Unirest.get("http://localhost:3000/api/v1/students/#{params[:id]}").body
  end

  def update
    @student = Unirest.get("http://localhost:3000/api/v1/students/#{params[:id]}").body
    Unirest.patch("http://localhost:3000/api/v1/students/#{@student['id']}", headers: {"Accept" => "application/json"}, parameters: {first_name: params[:first_name], last_name: params[:last_name], original_house: params[:original_house]}).body
    redirect_to "/api/v1/students/#{@student['id']}"
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy
    redirect_to "/api/v1/students"
  end

end
