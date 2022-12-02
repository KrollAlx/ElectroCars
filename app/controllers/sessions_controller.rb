class SessionsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def index
    @sessions = ChargingSession.all
    render json: @sessions
  end

  def show
    @session = ChargingSession.find(params[:id])
    render json: @session, serializer: ChargingSessionShowSerializer
  end

  def create
    connector = Connector.find(params[:connector_id])
    client = Client.find(params[:client_id])

    unless connector.free?
      render json: {error: "Connector not free"}, status: :internal_server_error
      return
    end

    client_sessions = ChargingSession.where(client: client).and(ChargingSession.where(state: "active"))
    unless client_sessions.empty?
      render json: {error: "Client is already charging"}, status: :internal_server_error
      return
    end

    @session = ChargingSession.create(amount: 0, state: 0, connector: connector, client: client)
    connector.taken!

    render json: @session, status: :created
  end

  def stop
    @session = ChargingSession.find(params[:id])

    if @session.stopped?
      render json: {error: "Session already stopped"}, status: :internal_server_error
      return
    end

    @session.stopped!
    @session.connector.free!

    render json: @session
  end

  private

  def record_not_found(exception)
    render json: {error: exception.message}, status: :not_found
  end
end
