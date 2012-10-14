class Ability

  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.is?('admin')
      # An admin has access to all features
      can :manage, :all
    else
      # Non admin users can at least manage their account
      can :manage, User, :id => user.id
      cannot :destroy, User, :id => user.id
      can :search_for_games
      cannot :search_for_members
      if user.is?('member')
        cannot :index, Member
        can :manage, Member, :id => user.profile.member_id
        cannot :destroy, Member
        can :manage, Child, :member_id => user.profile.member_id
        cannot :destroy, Child
        can :read, Membership, :member_id => user.profile.member_id
        # can :read, News
        can :read, Event, :private => false
        can :volunteer, Event, :private => false
        can :register, Event, :private => false
        can :participate, Event, :private => false
        can :read, [Game, GamePiece, GameCopy, GameCopyContent] 
        can :read, GameCard, :member_id => user.member_profile.id
        #can :read, Borrowing do |borrowing|
        #  borrowing.game_card.member_id = user.member_profile.id
        #end
        can :borrow, GameCopy, :status => 'IN'
        can :place_hold, GameCopy, :status => 'OUT'
      end
      if user.is?('volunteer')
        
      end
      if user.is?('employee')
        can :manage, Member
        cannot :destroy, Member
        can :manage, Child
        cannot :destroy, Child
      end
      if user.is?('board_member')
        can :manage, Event
      end
    end
  end
end
