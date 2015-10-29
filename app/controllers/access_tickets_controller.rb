class AccessTicketsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  before_action :authenticate_access_ticket!, only: [:show]
  before_action :set_access_ticket, only: [:show, :destroy]

  def index
    @access_tickets = current_user.access_tickets.order(
      expired_at: :desc, available_times: :desc, id: :asc).page(params[:page])
  end

  def show
    return if @access_ticket == current_access_ticket
    flash.now.alert = t("errors.messages.no_token")
    render template: "access_tickets/sessions/error"
  end

  def new
    @form = Forms::AccessTicketNew.new(count: 1)
    @form.build_access_ticket(expired_at: 1.years.since, available_times: 10)
  end

  def create
    attributes = access_ticket_params
    attributes[:access_ticket_attributes].merge!(user: current_user)
    @form = Forms::AccessTicketNew.new(attributes)

    if @form.valid?
      AccessTicketPublishJob.perform_later(attributes)
      redirect_to access_tickets_path, notice: t("informations.messages.generate", model: AccessTicket.model_name.human)
    else
      flash.now.alert = @form.errors
      render :new
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

  def access_ticket_params
    params.require(:forms_access_ticket_new).permit(:count, access_ticket_attributes: [:expired_at, :available_times])
  end
end
