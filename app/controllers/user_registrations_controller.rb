class UserRegistrationsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  def create
    @user = UserRegistration.new(user_registration_params)
    @user.status = "Activ"
    if @user.save
      render :json => {status: true,id: @user.id}
    else 
      render :json => {status: false,id: @user.id}
    end
  end
  def check_user_details
    @data = UserRegistration.all.where(:username => params[:username]).where(:password => params[:password])
    if @data.present?
      render :json => {status: true}
    else
      render :json => {status: false}
    end
  end
  def user_registration_params
    params.require(:user_registration).permit(:name,:address,:phone,:city,:description,:username,:password,:status)
  end

end
