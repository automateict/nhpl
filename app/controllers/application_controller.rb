class ApplicationController < ActionController::Base
  respond_to :html, :js, :json, :pdf
  before_action :set_application_calendar, :set_no_cache

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden, content_type: 'text/html' }
      format.html { redirect_to root_path, alert: exception.message }
      format.js   { head :forbidden, content_type: 'text/html' }
    end
  end

  def set_no_cache
    response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
  end

  def set_application_calendar
    ay = AcademicYear.current
    @application_calendar = ay.events.where('name = ?', 'Application').first rescue nil
  end

end
