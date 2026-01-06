class ModeratorController < ApplicationController
  before_action :authenticate_user!
  before_action :require_moderator!

  def dashboard
    # This is the moderator-only page
  end

  private

  def require_moderator!
    # CanCanCan will automatically raise an exception if user is not authorized
    authorize! :access, :moderator_dashboard
  end
end