class StudentsController < ApplicationController
	before_action :authenticate_admin!, except: [:index]
	before_action :find_student, only: [:edit, :update, :destroy]
  def new
  	@student=Student.new
  end

  def create
  	@student=Student.new(student_params)
  	if @student.save
  		redirect_to root_path, notice: "success"
  	else
  		render :new
  	end
  end

  def edit
  end

  def update
    if@student.update(student_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def index
  	@students=Student.all
  end

  def destroy
  	@student.delete
  	redirect_to @student
  end

  private
  	def student_params
  		params.require(:student).permit(:name, :marks)
  	end

  	def find_student
  		@student=Student.find(params[:id])
  	end

end
