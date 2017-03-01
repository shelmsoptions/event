class DiscussionsController < ApplicationController

  def create
    discussion = Discussion.new( comment_params )
    puts discussion.comment
    if discussion.save
    else
      puts "errors"
      flash[:errors] = discussion.errors.full_messages
    end
    redirect_to "/events/#{discussion.event_id}"
  end

  private
  def comment_params
    params.require(:discussion).permit(:comment, :user_id, :event_id)
  end
end
