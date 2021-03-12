class AddressInfoController < ApplicationController
  def new
  end

  def create
    @address = Address.where(user_id: current_user).first_or_initialize
    if @address.update(address_params)
      # Go to next interface
    else
      render 'new'
    end
  end

  private
  
  def address_params
    params.require(:address).permit(:nationality, :province, :city, :remaining_address,
                                    :country, :post_cd, :mail_id, :phone_no, 
                                    :linkedIn_url, :twitter_url )
  end

end
