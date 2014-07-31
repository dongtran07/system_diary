class CommentsController < ApplicationController
  def create
    @comment_hash = comment_params
    @obj = Post.find(@comment_hash[:commentable_id])
    # Not implemented: check to see whether the user has permission to create a comment on this object
    @comment = Comment.build_from(@obj, current_user.id, @comment_hash[:body])
    mentions_mail= @comment.body.scan(/@\S+/)
    if @comment.save
      sync_new @comment
      if(mentions_mail.count > 0)
        mentions_mail.each do |mention_mail|
          mail=mention_mail.split('@')[1]+"@vccloud.vn"
          CommentMailer.mention_mail_send(mail,@comment.user.name,@obj).deliver
        end
      end
      respond_to do |format|
        format.html { redirect_to post_path(@obj)}
        format.js
      end
    end
  end
  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      sync_destroy @comment
      respond_to do |format|
        format.js
      end
    end  
  end
  private
  def comment_params
    params.require(:comment).permit(:commentable_id,:commentable_type, :user_id, :body)
  end
end
