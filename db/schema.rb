# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_01_29_121628) do

  create_table "academic_years", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "name"
    t.boolean "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "applicant_declarations", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.bigint "applicant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["applicant_id"], name: "index_applicant_declarations_on_applicant_id"
  end

  create_table "applicant_exam_hubs", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.bigint "applicant_id"
    t.bigint "exam_hub_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["applicant_id"], name: "index_applicant_exam_hubs_on_applicant_id"
    t.index ["exam_hub_id"], name: "index_applicant_exam_hubs_on_exam_hub_id"
  end

  create_table "applicant_services", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.bigint "applicant_id"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "sponsor"
    t.index ["applicant_id"], name: "index_applicant_services_on_applicant_id"
  end

  create_table "applicant_types", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "applicants", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.bigint "user_id"
    t.string "first_name"
    t.string "father_name"
    t.string "grand_father_name"
    t.string "gender"
    t.date "date_of_birth"
    t.string "place_of_birth"
    t.string "marital_status"
    t.string "nationality"
    t.bigint "region_id"
    t.string "city"
    t.string "street"
    t.string "pobox"
    t.string "phone"
    t.bigint "program_id"
    t.bigint "university_id"
    t.string "university_type"
    t.string "qualification"
    t.date "date_of_completion"
    t.bigint "applicant_type_id"
    t.bigint "exam_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "status"
    t.string "title"
    t.bigint "academic_year_id"
    t.index ["academic_year_id"], name: "index_applicants_on_academic_year_id"
    t.index ["applicant_type_id"], name: "index_applicants_on_applicant_type_id"
    t.index ["exam_type_id"], name: "index_applicants_on_exam_type_id"
    t.index ["program_id"], name: "index_applicants_on_program_id"
    t.index ["region_id"], name: "index_applicants_on_region_id"
    t.index ["university_id"], name: "index_applicants_on_university_id"
    t.index ["user_id"], name: "index_applicants_on_user_id"
  end

  create_table "application_instructions", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "declaration_details", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.bigint "applicant_declaration_id"
    t.bigint "declaration_id"
    t.boolean "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["applicant_declaration_id"], name: "index_declaration_details_on_applicant_declaration_id"
    t.index ["declaration_id"], name: "index_declaration_details_on_declaration_id"
  end

  create_table "declarations", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.text "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.bigint "academic_year_id"
    t.string "name"
    t.date "start_time"
    t.date "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["academic_year_id"], name: "index_events_on_academic_year_id"
  end

  create_table "exam_hubs", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "name"
    t.bigint "region_id"
    t.string "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "ceiling"
    t.index ["region_id"], name: "index_exam_hubs_on_region_id"
  end

  create_table "exam_types", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "exams", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.bigint "applicant_id"
    t.float "exam_result"
    t.float "exam_out_of"
    t.float "interview_result"
    t.float "interview_out_of"
    t.float "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["applicant_id"], name: "index_exams_on_applicant_id"
  end

  create_table "match_results", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.bigint "applicant_id"
    t.bigint "program_id"
    t.bigint "university_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["applicant_id"], name: "index_match_results_on_applicant_id"
    t.index ["program_id"], name: "index_match_results_on_program_id"
    t.index ["university_id"], name: "index_match_results_on_university_id"
  end

  create_table "passing_marks", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.bigint "academic_year_id"
    t.bigint "program_id"
    t.float "passing_mark"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["academic_year_id"], name: "index_passing_marks_on_academic_year_id"
    t.index ["program_id"], name: "index_passing_marks_on_program_id"
  end

  create_table "placements", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.bigint "applicant_id"
    t.bigint "program_id"
    t.bigint "university_id"
    t.boolean "published"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["applicant_id"], name: "index_placements_on_applicant_id"
    t.index ["program_id"], name: "index_placements_on_program_id"
    t.index ["university_id"], name: "index_placements_on_university_id"
  end

  create_table "programs", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "regions", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "services", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.bigint "applicant_service_id"
    t.string "institution"
    t.bigint "region_id"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["applicant_service_id"], name: "index_services_on_applicant_service_id"
    t.index ["region_id"], name: "index_services_on_region_id"
  end

  create_table "settings", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.float "exam_weight"
    t.float "interview_weight"
    t.float "additional_marks_for_female"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "timers", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "event"
    t.datetime "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "universities", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "applicant_declarations", "applicants"
  add_foreign_key "applicant_exam_hubs", "applicants"
  add_foreign_key "applicant_exam_hubs", "exam_hubs"
  add_foreign_key "applicant_services", "applicants"
  add_foreign_key "applicants", "academic_years"
  add_foreign_key "applicants", "applicant_types"
  add_foreign_key "applicants", "exam_types"
  add_foreign_key "applicants", "programs"
  add_foreign_key "applicants", "regions"
  add_foreign_key "applicants", "universities"
  add_foreign_key "applicants", "users"
  add_foreign_key "declaration_details", "applicant_declarations"
  add_foreign_key "declaration_details", "declarations"
  add_foreign_key "events", "academic_years"
  add_foreign_key "exam_hubs", "regions"
  add_foreign_key "exams", "applicants"
  add_foreign_key "match_results", "applicants"
  add_foreign_key "match_results", "programs"
  add_foreign_key "match_results", "universities"
  add_foreign_key "passing_marks", "academic_years"
  add_foreign_key "passing_marks", "programs"
  add_foreign_key "placements", "applicants"
  add_foreign_key "placements", "programs"
  add_foreign_key "placements", "universities"
  add_foreign_key "services", "applicant_services"
  add_foreign_key "services", "regions"
end
