class TweetsController < ApplicationController

  def index
    @tweets = Tweet.all
  end
  
  def new
    @tweet = Tweet.new
  end
  
  def create
    @tweet = Tweet.new(message: params[:tweet][:message], tdate: params[:tweet][:tdate])
    
    if @tweet.save
      flash[:notice] = 'つぶやきました'
      redirect_to '/'
    else
      render 'new'
    end
  end
  
  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    redirect_to '/'
  end
  
  def show
    @tweet = Tweet.find(params[:id])
  end
  
  def edit
    @tweet = Tweet.find(params[:id])
  end
  
  def update
    @tweet = Tweet.find(params[:id])
    @tweet.update(message: params[:tweet][:message], tdate: params[:tweet][:tdate])
    
    if @tweet.save
      flash[:notice] = '情報を更新しました'
      redirect_to '/'
    else
      render 'edit'
    end
  end
end