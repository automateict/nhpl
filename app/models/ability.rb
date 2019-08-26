class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
       user ||= User.new # guest user (not logged in)
       can :check_exam, Exam
       if user.admin?
         can :manage, :all
       else
         can :read, :all
         can :manage, Applicant, user_id: user.id rescue nil
         can :manage, ApplicantDeclaration, applicant_id: user.applicant.id rescue nil
         can :manage, ApplicantExamHub, applicant_id: user.applicant.id rescue nil
         can :manage, ApplicantService, applicant_id: user.applicant.id rescue nil
         can :manage, ProgramChoice, applicant_id: user.applicant.id rescue nil
         can :manage, UniversityChoice, group: { program_id: user.applicant.program_choice_ids } rescue nil
         can :exam_detail, Exam
       end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
