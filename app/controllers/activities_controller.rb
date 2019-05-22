class ActivitiesController < ApplicationController
    def create         
        event = Event.find(params["eventId"])
        activity = Activity.create(name: params["name"], event_id: event.id, start_time: params["startTime"], end_time: params["endTime"], description: params["description"], date: params["date"])
        event.activities.push(activity)

        render :json => activity
    end
end