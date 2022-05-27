# frozen_string_literal: true

require "rails_helper"

RSpec.describe Api::V1::DisbursementsController, type: :controller do
  describe "GET #index" do
    let(:merchant) { create(:merchant) }
    let(:params) { { merchant_id: merchant.id } }

    context "when merchant is found" do
      before do
        create(:disbursement, order: order)
        get :index, params: params
      end

      let(:merchant) { create(:merchant) }
      let(:order) { create(:order, merchant: merchant) }

      it "returns http success" do
        expect(response).to have_http_status(:success)
      end

      it "returns the disbursements for the given merchant and week" do
        expect(JSON.parse(response.body).count).to eq(1)
      end
    end
  end
end
