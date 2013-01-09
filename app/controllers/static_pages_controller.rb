class StaticPagesController < ApplicationController
  def home
    @simulation = current_user.simulations.build if signed_in?
  end

  def help
  end
  
  def about
  end

  def contact
  end
end
