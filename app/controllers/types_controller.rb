class TypesController < ApplicationController
  def show
    @posts = Post.where(type_id: params[:id])
  end
end
