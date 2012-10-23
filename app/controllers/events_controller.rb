class EventsController < ApplicationController

  respond_to :html, :xml, :json
  def index 
    # full_calendar will hit the index method with query parameters
    # 'start' and 'end' in order to filter the results for the
    # appropriate month/week/day. 
    @events_rel = Event.scoped
    @events_rel = @events_rel.after(params['start']) if (params['start'])
    @events_rel = @events_rel.before(params['end']) if (params['end'])
    logger.debug('Events_rel:')
    logger.debug(@events_rel)
    @events = Array.new
    if !@events_rel.nil?
      @events_rel.each do |ev| 
        @events << Event.find(ev.id)
      end
    end  
    logger.debug('Events:')
    logger.debug(@events)
    
    respond_with(@events)
  end
  
  def show
    @event = Event.find(params[:id])
    render :layout => false
  end
  
  def new
    @event = Event.new
  end
  
  def create
  
    logger.debug(params)
    
    @start_datetime = params["start_date"].to_s+" "+params["start_time"].to_s+":00"
    logger.debug(@start_datetime)
    @end_datetime = params["end_date"].to_s+" "+params["end_time"].to_s+":00"
    logger.debug(@end_datetime)

    @event = Event.new
    @event.title = params[:event][:title]
    @event.description = params[:event][:description]
    if params["start_time"].nil? || params["end_time"].nil?
      @event.allDay = true
    else 
      @event.start = @start_datetime
      @event.end = @end_datetime
    end
    if @event.save 
      flash[:notice] = "Successfully created event"
    end
    redirect_to '/calendar/index'
  end

  def volunteer
    @event = Event.find(params[:id])
    @event.voluntary_works << VoluntaryWork.new(:member_id => current_user.member_profile.id, :volunteered_at => Time.now)
  end
end
