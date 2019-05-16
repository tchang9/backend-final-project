class TopicsController < ApplicationController

    def topic_comments
        topic = Topic.find(params["id"])
        comments = topic.comments

        render :json => comments    
    end

end