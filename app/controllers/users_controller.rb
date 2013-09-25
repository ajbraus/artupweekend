class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
  def users_names
    @users_names = User.order(:name).where("lower(name) like ?", "%#{params[:term].downcase}%")
    render json: @users_names.map(&:name)
  end
end