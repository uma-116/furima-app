# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]


  def new
    @user = User.new
  end

  def create
    @user = User.new(sign_up_params)
    if @user.valid?
      session["devise.regist_data"] = {user: @user.attributes}
      session["devise.regist_data"][:user]["password"] = params[:user][:password]
      redirect_to addresses_path
    else
      render :new
    end
  end

  def address_registration
    @user = User.new(session["devise.regist_data"]["user"])
    @address = Address.new
  end

  def create_address
    @user = User.new(session["devise.regist_data"]["user"])
    @address = Address.new(address_params)
    if @address.valid?
      @user.save
      @address = Address.new(address_params.merge(user_id: @user.id))
      @address.save
      session["devise.regist_data"]["user"].clear
      sign_in(:user, @user)
    else
      render :address_registration
    end
  end

  protected

  def address_params
    params.require(:address).permit(:postal_code, :prefecture, :city, :address, :apartment_name)
  end

end
