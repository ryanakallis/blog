class CommentsController < ApplicationController
before_filter :authenticate_user!, only: [:create, :destroy]

  # http_basic_authenticate_with name: "Angus", password: "eetsM!llerTime", only: :destroy

  def create
    @post    = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @post, notice: 'Comment was successfully created.' }
        format.json { render action: 'show', status: :created, location: @comment }
      else
        format.html { render action: 'new' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @post    = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to post_path(@post) }
      format.json { head :no_content }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:post_id, :commenter, :body)
  end

end
