class SimulationsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]
  before_filter :correct_user, only: :destroy
  def create
    @simulation = current_user.simulations.build(params[:simulation])
    if @simulation.save
      flash[:success] = "Simulation created!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def destroy
    @simulation.destroy
    redirect_to root_url
  end

  private

   def correct_user
      @simulation = current_user.simulations.find_by_id(params[:id])
      redirect_to root_url if @simulation.nil?
   end
end


