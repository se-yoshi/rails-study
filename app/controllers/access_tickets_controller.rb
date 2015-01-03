class AccessTicketsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  before_action :authenticate_access_ticket!, only: [:show]

  def show
  end
end
