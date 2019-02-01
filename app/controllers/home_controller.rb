class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @academic_year = AcademicYear.current
    @events = @academic_year.blank? ? [] : @academic_year.events
  end
end
