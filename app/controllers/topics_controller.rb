class TopicsController < ApplicationController

    def topic_comments
        topic = Topic.find(params["id"])
        comments = topic.comments

        # comments_hash = {}
        # comments.each do |comment|
        #     comments_hash[comment.id] = comment
        # end

        render :json => comments    
    end

end