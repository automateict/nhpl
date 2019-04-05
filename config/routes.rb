Rails.application.routes.draw do
  resources :license_results
  resources :exam_settings
  resources :passing_marks
  resources :applicant_types
  resources :exam_types
  resources :placements do
    collection do
      get 'match'
      get 'publish'
      get 'clear'
      get 'statistics'
    end
  end
  resources :settings
  resources :exams do
    collection do
      get 'import_exam'
      post 'import_exam'
      get 'import_interview'
      post 'import_interview'
      get 'exam_detail'
    end
  end
  resources :timers, path: 'countdown' do
    collection do
      get 'load_deadline'
    end
  end
  resources :application_instructions
  resources :applicant_exam_hubs
  resources :exam_hubs
  resources :regions
  resources :match_results
  resources :events
  resources :academic_years
  resources :universities
  resources :programs
  resources :applicants do
    collection do
      get 'instructions'
      get 'load_other_university'
      get 'load_disability'
      get 'licensing'
      get 'grade'
      get 'load_attachments'
    end
    member do
      get 'details'
      get 'submit'
    end
  end
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }

  scope "/admin" do
    resources :users do
      member do
        get 'confirm'
      end
    end
  end

  get 'home/index'
  root to: 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
