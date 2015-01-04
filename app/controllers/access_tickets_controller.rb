class AccessTicketsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  before_action :authenticate_access_ticket!, only: [:show]
  before_action :set_access_ticket, only: [:show, :destroy]

  def index
    @access_tickets = AccessTicket.where(user: current_user)
  end

  def show
    if @access_ticket != current_access_ticket
      flash.now[:alert] = t("errors.no_token")
      render template: "access_tickets/sessions/error"
    end
  end

  def create
    @access_ticket = AccessTicket.new(
      user: current_user,
      authentication_token: SecureRandom.hex(32),
      expired_at: 1.years.since,
      available_times: 10
    )

    if @access_ticket.save
      redirect_to access_tickets_path, notice: "アクセスチケットを生成しました。"
    else
      render :index
    end
  end

  def destroy
    @access_ticket.destroy
    redirect_to access_tickets_path, notice: "アクセスチケットを削除しました。"
  end

  private

  def set_access_ticket
    @access_ticket = AccessTicket.find(params[:id])
  end
end
