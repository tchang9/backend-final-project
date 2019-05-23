class EventsController < ApplicationController

    def index
        
    end

    def create
        event = Event.create(name: params["name"], start_date: params["startDate"], end_date: params["endDate"], location: params["location"])
        user = curr_user
        user.events.push(event)

        render :json => event

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

    def update
        event = Event.find(params["id"])
        event.update(name: params["name"], location: params["location"], start_date: params["startDate"], end_date: params["endDate"])

        render :json => event
    end

    def join_event
        event = Event.find(params["id"])


        if curr_user
            if curr_user.events.include?(event)
                render :json => {message: "Already joined the event"}
            else
                curr_user.events.push(event)
                render :json => {message: "Redirect to events"}
            end
        else
            #sending the event back to redirect them to the login page
            render :json => event
        end

    end

    private

    def event_topics_params
        params.require(:event).permit(:id)
    end

end
