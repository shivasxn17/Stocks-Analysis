class UsersController < ApplicationController
	before_action :set_user, only: [:edit, :update, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  before_action :require_admin, only: [:destroy]

	def my_portfolio
		
	end
	
	def index
		@users = User.paginate(page: params[:page], per_page: 2)
	end

	def new
		@user = User.new
	end

	def edit
	end

	def show
		@user_employees = @user.employees.paginate(page: params[:page], per_page: 2)
	end

	def update
		if @user.update(user_params)
			flash[:success] = "Account info updated successfully"
			redirect_to  employees_path
		else
			render 'new'
		end
	end

	def create
		# debugger
		@user = User.new(user_params)

		if @user.save
			flash[:success]  = "#{@user.username} Welcome to the Dashboard Management System"
			redirect_to employees_path
		else
			render 'new'		
		end
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		flash[:danger] = "User and associated employees deleted"
		redirect_to users_path
	end


	private
		def user_params
			params.require(:user).permit(:username, :email, :password)
		end

		def set_user
			@user = User.find(params[:id])
		end

		def require_same_user
			if current_user != @user and !current_user.admin?
				flash[:danger] = "You can only edit your own profile!"
				redirect_to root_path
			end
		end

		def require_admin
			if logged_in? and !current_user.admin?
				flash[:danger] = "This action requires Admin Priviledges"
				redirect_to root_path
			end
		end
end