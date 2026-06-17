class TweetsController < ApplicationController
  before_action :set_tweet, only: %i[ show edit update destroy ]

  # GET /tweets or /tweets.json
  def index
      @tweets = Tweet.all
      search = params[:search]
      
      if search.present?
        keyword = "%#{search}%"
        @tweets = @tweets.joins(:user).where(
          "genre LIKE ? OR part LIKE ? OR tool LIKE ? OR level LIKE ? OR size LIKE ? OR jump LIKE ?",
          keyword, keyword, keyword, keyword, keyword, keyword
        )
      end

      if params[:genre].present?
        @tweets = @tweets.where(
        "genre LIKE ?",
        "%#{params[:genre]}%"
         )
      end

      if params[:liked].present?
          @tweets = @tweets.joins(:likes)
                          .where(likes: { user_id: current_user.id })
      end

      if params[:level].present?
        @tweets = @tweets.where(level: params[:level])
      end

      if params[:part].present?
        @tweets = @tweets.where(
          "part LIKE ?",
          "%#{params[:part]}%"
        )
      end

      if params[:tool].present?
        @tweets = @tweets.where(tool: params[:tool])
      end

      if params[:size].present? && params[:size] != "選択して下さい"
        @tweets = @tweets.where(size: params[:size])
      end

      if params[:jump].present? && params[:jump] != "選択して下さい"
        @tweets = @tweets.where(jump: params[:jump])
      end

    end

  # GET /tweets/1 or /tweets/1.json
  
  def show
  end

  # GET /tweets/new
  def new
    @tweet = Tweet.new
  end

  # GET /tweets/1/edit
  def edit
    @tweet = Tweet.find(params[:id])
  end

  # POST /tweets or /tweets.json
  def create
    @tweet = Tweet.new(tweet_params)

    @tweet.user_id = current_user.id if user_signed_in?

    respond_to do |format|
      if @tweet.save
        format.html { redirect_to @tweet, notice: "Tweet was successfully created." }
        format.json { render :show, status: :created, location: @tweet }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tweets/1 or /tweets/1.json
  def update
    respond_to do |format|
      if @tweet.update(tweet_params)
        format.html { redirect_to @tweet, notice: "Tweet was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @tweet }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tweets/1 or /tweets/1.json
  def destroy
    @tweet.destroy!

    respond_to do |format|
      format.html { redirect_to tweets_path, notice: "Tweet was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tweet_params
      params.require(:tweet).permit(:genre, :part, :tool, :image, :level,:size,:jump,:note,:youtube_url,:video)
    end
end
