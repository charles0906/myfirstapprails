class PostsController < ApplicationController
  def index
    @posts = Post.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @posts }
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = @post.comments.new
    #@comments = Comment.where(:post_id => @post.id).all
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @post }
      #format.json { render :json => @comments }
    end
  end

  def new
    @post = Post.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @post }
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(params[:post])

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, :notice => 'Post was successfully created.' }
        format.json { render :json => @post, :status => :created, :location => @post }
      else
        format.html { render :action => "new" }
        format.json { render :json => @post.errors, :status => :unprocessable_entity }
      end
    end
  end


  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, :notice => 'Post was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :ok }
    end
  end
end
