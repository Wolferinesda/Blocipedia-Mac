class DowngradeController < ApplicationController

  def new
  end

  def create
    current_user.update_attribute(:role, 'standard')
    current_user.wikis.each do |publicc|
      publicc.update_attribute(:private, false)
    end
    # re = Stripe::Refund.create( charge: "")
    flash[:notice] = "Your account has been downgraded to a standard account. Your private wikis are now public."
    redirect_to root_path
  end
end
