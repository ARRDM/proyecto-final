class ProfileController < ApplicationController
	before_action :set_user, only: [:show, :destroy]
  def index
  	@user = current_user
  end

  def show
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Cuenta eliminada' }
      format.json { head :no_content }
    end
  end

  private

	def set_user
	  @user = User.find(params[:id])
	end

end
