class AddressInfoController < ApplicationController
  def new
  end

  def create
    @address = Address.find_by(user_id: current_user)
    if @address
      if @address.update(address_params)
        flash[:notice] = "Thank You for updating your address"
      else
        render 'new'
      end
    else
      @address = Address.new(address_params)
      @address.user = current_user
      if @address.save
        flash[:notice] = "Thank You for providing your address"
      else
        render 'new'
      end
    end
  end

  private
  
  def address_params
    params.require(:address).permit(:nationality, :province, :city, :remaining_address,
                                    :country, :post_cd, :mail_id, :phone_no, 
                                    :linkedIn_url, :twitter_url )
  end

end
