# frozen_string_literal: true

class AddressInfosController < ApplicationController
  def new
    @address = Address.new
  end

  def edit
    @address = Address.where(user_id: current_user.id).first_or_initialize
  end

  def create
    @address = Address.new(address_params)
    @address.user = current_user
    if @address.save
      redirect_to new_education_info_path
    else
      render 'new'
    end
  end

  def update
    @address = Address.where(user_id: current_user.id).first_or_initialize
    if @address.update(address_params)
      flash[:notice] = t('address_infos.update_success_message')
      redirect_to root_path
    else
      render 'edit'
    end
  end

  private

  def address_params
    params.require(:address).permit(:nationality, :province, :city, :remaining_address,
                                    :country, :post_cd, :mail_id, :phone_no,
                                    :linkedIn_url, :twitter_url)
  end
end
