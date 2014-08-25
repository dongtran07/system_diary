class PostsController < ApplicationController
  around_filter :catch_not_found
  def index
    if params[:tag]
      @posts = Post.paginate(:page => params[:page], :per_page => 7).tagged_with(params[:tag]).order('created_at DESC')
    else
      @posts= Post.paginate(:page => params[:page], :per_page => 7).order('created_at DESC')
    end
  end
      
  def show
    @post = Post.find(params[:id])
    @comments = @post.comment_threads
    @new_comment = Comment.build_from(@post, current_user.id, "")
    @post.record_timestamps=false
    @post.update(page_view: @post.page_view+1)  
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post= Post.new(post_params)
    @post.user_id= current_user.id
    @mentionlist = params[:post][:mentionlist]
    mentions_mail= @mentionlist.scan(/@\S+/)   
    if @post.save
      sync_new @post
      flash[:success]="Create post successful"
      redirect_to root_url
      if(mentions_mail.count > 0)
        mentions_mail.each do |mention_mail|
          mail=mention_mail.split('@')[1]+"@vccloud.vn"
          PostMailer.new_post_send(mail,@post.user.name,@post).deliver
        end
      end
    else
      render "new"
    end
  end
  def edit
    @post= Post.find(params[:id])
    if(current_user.id != @post.user_id)
      redirect_to root_url
    end
  end
  def update 
   @post= Post.find(params[:id])
    if @post.update(post_params)
      flash[:success] = "Update post successful"
      redirect_to @post
    else
      render "edit"
    end
  end
  
  private 
    def post_params
      params.require(:post).permit(:content,:type_id,:tag_list,:bootsy_image_gallery_id)
    end
   def catch_not_found
     yield
     rescue ActiveRecord::RecordNotFound
     redirect_to root_url, :flash => { :error => "Record not found." }
   end
end
