class HomeController < ApplicationController
  before_action :authenticate_user!, except: [:check_exam_result]
  def index
    @academic_year = AcademicYear.current
    @events = @academic_year.blank? ? [] : @academic_year.events
  end

  def check_exam_result
  end

end
