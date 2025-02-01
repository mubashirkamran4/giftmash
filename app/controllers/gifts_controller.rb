class GiftsController < ApplicationController
  before_action :set_gift, only: %i[ show edit update destroy upvote ]

  def giftmash
    @random_gifts = Gift.where(id: [*Gift.minimum(:id)..Gift.maximum(:id)].sample(2))
  end

  def results
    @gifts = Gift.all.order(upvotes: :desc, downvotes: :asc)
  end

  # GET /gifts or /gifts.json
  def index
    @gifts = Gift.all
  end

  # GET /gifts/1 or /gifts/1.json
  def show
  end

  # UPVOTE THE GIFTS
  def upvote
    @gift.update!(upvotes: @gift.upvotes += 1)
    downvoted_gift = Gift.find(params[:downvoted_gift_id])
    downvoted_gift.update!(downvotes: downvoted_gift.downvotes += 1)
    redirect_to giftmash_gifts_path
  end

  # GET /gifts/new
  def new
    @gift = Gift.new
  end

  # GET /gifts/1/edit
  def edit
  end

  # POST /gifts or /gifts.json
  def create
    @gift = Gift.new(gift_params)

    respond_to do |format|
      if @gift.save
        format.html { redirect_to @gift, notice: "Gift was successfully created." }
        format.json { render :show, status: :created, location: @gift }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @gift.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gifts/1 or /gifts/1.json
  def update
    respond_to do |format|
      if @gift.update(gift_params)
        format.html { redirect_to @gift, notice: "Gift was successfully updated." }
        format.json { render :show, status: :ok, location: @gift }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @gift.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gifts/1 or /gifts/1.json
  def destroy
    @gift.destroy!

    respond_to do |format|
      format.html { redirect_to gifts_path, status: :see_other, notice: "Gift was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gift
      @gift = Gift.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def gift_params
      params.require(:gift).permit(:name, :image_url, :url, :downvoted_gift_id)
    end
end
