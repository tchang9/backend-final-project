class EventsController < ApplicationController

    def index
        
    end

    def event_topics
        event = Event.find(event_topics_params["id"])
        topics = event.topics

        topics_hash = {}
        topics.each do |topic|
            topics_hash[topic.id] = topic
        end

        render :json => topics_hash   
    end

    def event_activities
        event = Event.find(params["id"])
        activities = event.activities

        render :json => activities
    end

    private

    def event_topics_params
        params.require(:event).permit(:id)
    end

end
