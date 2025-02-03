require 'rails_helper'

RSpec.describe GiftsController, type: :controller do
  let!(:gift) { create(:gift, name: 'liked_gift', upvotes: 0, downvotes: 0) }
  let!(:downvoted_gift) { create(:gift, name: 'not_liked_gift', upvotes: 0, downvotes: 0) }

  describe "PATCH #upvote" do
    it "when called, it increments to upvotes of the liked gift, and increments to downvotes for the other gift" do
      params = { id: gift.id, downvoted_gift_id: downvoted_gift.id }

      patch :upvote, params: params

      gift.reload
      downvoted_gift.reload

      expect(gift.upvotes).to eq(1)
      expect(downvoted_gift.downvotes).to eq(1)
      expect(response).to redirect_to(giftmash_gifts_path)
    end
  end
end
