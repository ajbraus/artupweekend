class EventApplicationsController < ApplicationController
  before_filter :authenticate_user!
  
  # GET /event_applications
  # GET /event_applications.json
  def index
    if current_user.admin?
      @event_applications = EventApplication.all
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @event_applications }
      end
    else
      redirect_to root_path, notice: "Oops, here you go!"
    end
  end

  # GET /event_applications/1
  # GET /event_applications/1.json
  def show
    @event_application = EventApplication.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event_application }
    end
  end

  # GET /event_applications/new
  # GET /event_applications/new.json
  def new
    @event_application = EventApplication.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event_application }
    end
  end

  # GET /event_applications/1/edit
  def edit
    @event_application = EventApplication.find(params[:id])
  end

  # POST /event_applications
  # POST /event_applications.json
  def create
    @event_application = EventApplication.new(params[:event_application])

    respond_to do |format|
      if @event_application.save
        Notifier.event_application_received(current_user, @event_application).deliver

        format.html { redirect_to root_path, notice: 'Event application was successfully submitted.' }
        format.json { render json: @event_application, status: :created, location: @event_application }
      else
        format.html { render action: "new" }
        format.json { render json: @event_application.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /event_applications/1
  # PUT /event_applications/1.json
  def update
    @event_application = EventApplication.find(params[:id])

    respond_to do |format|
      if @event_application.update_attributes(params[:event_application])
        format.html { redirect_to @event_application, notice: 'Event application was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event_application.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_applications/1
  # DELETE /event_applications/1.json
  def destroy
    @event_application = EventApplication.find(params[:id])
    @event_application.destroy

    respond_to do |format|
      format.html { redirect_to event_applications_url }
      format.json { head :no_content }
    end
  end
end
