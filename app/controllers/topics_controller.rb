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

    def create 
        topic = Topic.create(event_id: params["id"], label: params["topicName"])
        comment = Comment.create(comment: params["comment"], topic_id: topic.id, user_id: curr_user.id)
        topic.comments.push(comment)

        render :json => topic
    end

end