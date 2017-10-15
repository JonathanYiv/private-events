class InvitationsController < ApplicationController
  before_action :logged_in_user
  before_action :different_user, only: :new

  def show
  end

  def new
    @invitation = current_user.sent_invitations.new
    @user = User.find(params[:user_id])
    @invitation.invited = @user
  end

  def create
    @invitation = Invitation.new(invitation_params)
    if @invitation.save
      flash[:success] = "Your invitation has been sent."
      redirect_to root_path
    else
      @user = User.find(params[:invitation][:invited_id])
      render 'new'
    end
  end

  def destroy
  end

  private

    def invitation_params
      params.require(:invitation).permit(:invited_id, :inviter_id, :event_id)
    end

    def logged_in_user
      unless logged_in?
        flash[:info] = "You must be logged in to do that."
        redirect_to login_path
      end
    end

    def different_user
      user = User.find(params[:user_id])
      if current_user == user
        flash[:info] = "You can't invite yourself to events!"
        redirect_to root_path
      end
    end
end
