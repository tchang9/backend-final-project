class CommentsController < ApplicationController
    def create 
        topic = Topic.find(params["topicId"])
        comment = Comment.create(comment: params["comment"], topic_id: topic.id, user_id: curr_user.id)
        topic.comments.push(comment)

        render :json => comment
    end
end