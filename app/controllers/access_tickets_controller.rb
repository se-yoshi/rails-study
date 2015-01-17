class AccessTicketsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  before_action :authenticate_access_ticket!, only: [:show]
  before_action :set_access_ticket, only: [:show, :destroy]

  def index
    @access_tickets = current_user.access_tickets.order(expired_at: :desc, available_times: :asc, id: :asc).page(params[:page])
  end

  def show
    return if @access_ticket == current_access_ticket
    flash.now[:alert] = t("errors.messages.no_token")
    render template: "access_tickets/sessions/error"
  end

  def create
    @access_ticket = AccessTicket.new(
      user: current_user,
      expired_at: 1.years.since,
      available_times: 10
    )

    if @access_ticket.save
      redirect_to access_tickets_path, notice: t("informations.messages.generate", model: AccessTicket.model_name.human)
    else
      render :index
    end
  end

  def destroy
    @access_ticket.destroy
    redirect_to access_tickets_path, notice: t("informations.messages.delete", model: AccessTicket.model_name.human)
  end

  private

  def set_access_ticket
    @access_ticket = AccessTicket.find(params[:id])
  end
end
