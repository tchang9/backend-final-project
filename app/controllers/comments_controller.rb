class CommentsController < ApplicationController
    def create 

        # user = User.find(params[:id])

        topic = Topic.find(params["topicId"])
        # TODO- change the hard coded USER to CURRENT USER
        comment = Comment.create(comment: params["comment"], topic_id: topic.id, user_id: 5)
        topic.comments.push(comment)

        render :json => comment
    end
end