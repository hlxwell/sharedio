class SharingFilesController < ApplicationController
  before_filter :authenticate_user!, :find_sharing
  before_filter :get_object, :only => [:show, :edit, :update, :destroy]

  def index
    @sharing_files = @sharing.sharing_files.all

    respond_to do |format|
      format.json { render :json => @sharing_files.to_json(:methods => [:download_store_path, :url]) }
      format.html
    end
  end

  def show
    respond_to do |format|
      format.html
      format.json { render :json => @sharing_files.to_json(:methods => [:download_store_path, :url]) }
    end
  end

  def new
    @sharing_file = @sharing.sharing_files.new

    respond_to do |format|
      format.html
      format.json { render :json => @sharing_file }
    end
  end

  def create
    @sharing_file = @sharing.sharing_files.new params[:sharing_file]

    respond_to do |format|
      if @sharing_file.save
        format.html { redirect_to [@sharing, @sharing_file], :notice => 'sharing_file was successfully created.' }
        format.json { render :json => @sharing_file, :status => :created }
      else
        format.html { render :action => "new" }
        format.json { render :json => @sharing_file.errors, :status => :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @sharing_file.update_attributes(params[:sharing_file])
        format.html { redirect_to [@sharing, @sharing_file], :notice => 'sharing_file was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @sharing_file.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @sharing_file.destroy

    respond_to do |format|
      format.html { redirect_to sharing_sharing_files_url(@sharing) }
      format.json { head :ok }
    end
  end

  private

  def get_object
    @sharing_file = @sharing.sharing_files.find(params[:id])
  end

  def find_sharing
    @sharing = current_user.sharings.find(params[:sharing_id])
  end

end
