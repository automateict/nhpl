class Exam < ApplicationRecord
  belongs_to :applicant

  #before_save :set_total, if: :exam_and_interview_result_exists

  def exam_and_interview_result_exists
    !exam_result.blank? and !interview_result.blank?
  end

  def self.import_exam(file)
    exams = []
    CSV.foreach(file.path, :headers=>true) do |row|
      applicant = Applicant.find_by(application_id: row[0])
      email = row[1]
      program = Program.find_by(code: row[2])
      exam_result = row[3]
      exam_out_of = row[4]
		      attrbts = {applicant_id: applicant.id, exam_result: exam_result,
		           exam_out_of: exam_out_of }
		      ex = Exam.find_by(applicant_id: applicant.id) || new
		      ex.attributes = attrbts
		      ex.save(validate: false)
		      exams << ex
    end
    return exams
  end

  def self.import_interview(file)
    interviews = []
    CSV.foreach(file.path, :headers=>true) do |row|
      applicant_id = row[0]
      email = row[1]
      interview_result = row[2]
      interview_out_of = row[3]
      unless email.blank?
        user = User.find_by_email(email)
        applicant = user.applicant
        unless applicant.blank?
          attrbts = {applicant_id: applicant.id, interview_result: interview_result,
                   interview_out_of: interview_out_of }
          unless applicant.blank?
            interview = Exam.find_by_applicant_id(applicant.id) || new
            interview.attributes = attrbts
            interview.save!
            interviews << interview
          end
        end
      end
    end
    return interviews
  end

  def exam_weight_percentage
    setting = Setting.first
    unless setting.blank?
      ((exam_result/exam_out_of) * setting.exam_weight).round(2)
    end
  end

  def total_mark
    setting = Setting.first
    ((exam_result/exam_out_of) * setting.exam_weight) +
        ((interview_result/interview_out_of) * setting.interview_weight)
  end

  def set_total
    setting = Setting.first
    unless setting.blank?
      self[:total] = (total_mark + added_mark).round(2)
    end
  end

  def added_mark
    setting = Setting.first
    unless setting.blank?
      return applicant.gender == 'Female' ? (setting.additional_marks_for_female.to_f/100)* total_mark : 0
    else
      return 0
    end
  end

end
