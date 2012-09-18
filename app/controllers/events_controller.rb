class EventsController < ApplicationController
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
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @events }
      format.js { render :json => @events }
    end
  end
  
  def new
    @event = Event.new
  end
  
  def create
  
    logger.debug(params)
    @start_datetime = params[:event]["start(1i)"].to_s+"-"+params[:event]["start(2i)"].to_s+"-"+params[:event]["start(3i)"].to_s+" "+params[:event]["start(4i)"].to_s+":"+params[:event]["start(5i)"].to_s+":00"
    logger.debug(@start_datetime)
    @end_datetime = params[:event]["end(1i)"].to_s+"-"+params[:event]["end(2i)"].to_s+"-"+params[:event]["end(3i)"].to_s+" "+params[:event]["end(4i)"].to_s+":"+params[:event]["end(5i)"].to_s+":00"
    
    logger.debug(@end_datetime)
    
    params[:event][:start] = @start_datetime
    params[:event][:end] = @end_datetime
    
    logger.debug(params)
    #@event = Member.new({:title => params[:event][:title], :description => params[:event][:description], :start => @start_datetime, :end => @end_datetime, :allDay => false}, :without_protection => true)
    @event = Event.new
    @event.title = params[:event][:title]
    @event.description = params[:event][:description]
    @event.start = @start_datetime
    @event.end = @end_datetime
    @event.allDay = false
    if @event.save 
      flash[:notice] = "Successfully created event"
    end
    redirect_to '/calendar/index'
  end
end
