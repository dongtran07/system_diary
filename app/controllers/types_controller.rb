class TypesController < ApplicationController
  def show
    @posts = Post.where(type_id: params[:id]).paginate(:page => params[:page], :per_page => 7).order('created_at DESC')
  end
end
