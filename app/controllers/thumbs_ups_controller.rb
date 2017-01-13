class ThumbsUpsController < ApplicationController
  def new
    @thumbs_up = ThumbsUp.new
    @users = User.where.not(id: current_user.id).pluck(:username, :id)
  end

  def create
    @thumbs_up = ThumbsUp.new(thumbs_ups_params)
    @thumbs_up.sender_id = current_user.id
    if @thumbs_up.save
      flash[:success] = "Yay, you've sent a thumbsup!"
      redirect_to "/"
    else
      flash[:warning] = "Oops, something went wrong!"
      render :new
    end
  end

  private
  def thumbs_ups_params
    params.require(:thumbs_up).permit(:receiver_id, :message)
  end
end
