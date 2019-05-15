class EventsController < ApplicationController

    def index
        
    end

    def event_topics
        event = Event.find(event_topics_params["id"])
        topics = event.topics

        render :json => topics   
    end

    private

    def event_topics_params
        params.require(:event).permit(:id)
    end

end
