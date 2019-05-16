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
        # byebug
        topic = Topic.create(event_id: params["id"], label: params["topicName"])
        # TODO- change the hard coded USER to CURRENT USER
        comment = Comment.create(comment: params["comment"], topic_id: topic.id, user_id: 5)
        topic.comments.push(comment)

        render :json => topic
    end

end