class UsersController < ApplicationController
  before_filter :authenticate_user!

  def current
    respond_to do |format|
      format.json { render :json => current_user.to_json( :methods => :used_space ) }
    end
  end
end
