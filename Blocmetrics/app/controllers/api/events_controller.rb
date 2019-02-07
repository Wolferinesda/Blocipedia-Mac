class API::EventsController < ApplicationController
  skip_before_action :verify_authenticity_token
  skip_before_action :authenticate_user!, only: [:create]

  before_action :set_access_control_headers

  def set_access_control_headers
    headers['Access-Control-Allow-Origin'] = 'http://localhost'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Allow-Headers'] = 'Content-Type'
  end

  def create
    registered_application = RegisteredApplication.find_by(url: request.env['HTTP_ORIGIN'])
    puts '==DEBUG: events_controller#create=='
    puts "registered application: #{registered_application}\n"
    puts "url: #{request.env['HTTP_ORIGIN']}\n"
    puts "request.env: #{request.env.inspect}\n"
    puts "event_params: #{event_params}"

    if registered_application.nil?
      render json: "Unregistered application", status: :unprocessable_entity
    end

    @event = registered_application.events.new(event_params)
    if @event.save
      render json: @event, status: :created
    else
      render json: {errors: @event.errors}, status: :unprocessable_entity
    end
  end


  def preflight
    head 200
  end

  private

  def event_params
    params.require(:event).permit(:name)
  end
end
