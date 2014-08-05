class PostsController < ApplicationController
  
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
    @post.update(page_view: @post.page_view+1)  
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post= Post.new(post_params)
    @post.user_id= current_user.id
    if @post.save
      sync_new @post
      flash[:success]="Create post successful"
      redirect_to root_url
    else
      render "new"
    end
  end
  def edit
    @post= Post.find(params[:id])
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

  def destroy
    @post= Post.find(params[:id])
    @post.destroy
    sync_destroy @post
    flash[:success] = "Post deleted"
    redirect_to root_url
  end
  
  private 
    def post_params
      params.require(:post).permit(:content_header,:content,:type_id,:tag_list,:bootsy_image_gallery_id)
    end
end
