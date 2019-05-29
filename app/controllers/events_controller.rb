class EventsController < ApplicationController

    def create
        event = Event.create(name: params["name"], start_date: params["startDate"], end_date: params["endDate"], location: params["location"])
        user = curr_user
        user.events.push(event)

        render :json => event

    end

    def show 
        event = Event.find(params["id"])

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

        # if someone is logged in:
        if curr_user
            # check if they are already part of the event
            if curr_user.events.include?(event)
                render :json => {message: "Already joined the event"}
            else
            # if they are not part of the event, add them to the event
                curr_user.events.push(event)
                render :json => {message: "Redirect to events"}
            end
        else
            #sending the event back to redirect them to the login page
            render :json => event
        end

    end

    def event_users
        event = Event.find(params["eventId"])
        event_users = event.users

        event_users_hash = {}
        event_users.each do |user|
            event_users_hash[user.id] = user
        end

        render :json => event_users_hash
    end 

    def destroy
        event = Event.find(params["id"])
        event.topics.each do |topic|
            topic.comments.destroy_all
        end

        event.topics.destroy_all
        event.destroy

        render :json => event.id
    end

    private

    def event_topics_params
        params.require(:event).permit(:id)
    end

end
