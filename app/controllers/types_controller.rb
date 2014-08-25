class TypesController < ApplicationController
  def show
    @posts = Post.where(type_id: params[:id]).paginate(:page => params[:page], :per_page => 7).order('created_at DESC')
  end
  def create

    @type= Type.new(type_params)
    @type.bg_class= "bg-navy"
    @type.save
    respond_to do |format|
      format.js
    end
  end
  private
    def type_params
      params.require(:type).permit(:name, :class_icon)
    end
end
