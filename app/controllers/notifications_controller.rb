class NotificationsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :get_object, :only => [:show, :edit, :update, :destroy]

  def index
    @notifications = current_user.notifications

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @notifications }
    end
  end

  def unviewed
    @notifications = current_user.notifications.unviewed
    @notifications.each(&:view!)

    respond_to do |format|
      format.html { render :index }
      format.json { render :json => @notifications }
    end
  end

  def viewed
    @notifications = current_user.notifications.viewed

    respond_to do |format|
      format.html { render :index }
      format.json { render :json => @notifications }
    end
  end

  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @notification }
    end
  end

  def new
    @notification = current_user.notifications.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @notification }
    end
  end

  def edit
  end

  def create
    @notification = current_user.notifications.new(params[:notification])

    respond_to do |format|
      if @notification.save
        format.html { redirect_to @notification, :notice => 'Notification was successfully created.' }
        format.json { render :json => @notification, :status => :created, :location => @notification }
      else
        format.html { render :action => "new" }
        format.json { render :json => @notification.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @notification.update_attributes(params[:notification])
        format.html { redirect_to @notification, :notice => 'Notification was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @notification.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @notification.destroy

    respond_to do |format|
      format.html { redirect_to notifications_url }
      format.json { head :ok }
    end
  end

  private

  def get_object
    @notification = current_user.notifications.includes(:user).find(params[:id])
  end
end