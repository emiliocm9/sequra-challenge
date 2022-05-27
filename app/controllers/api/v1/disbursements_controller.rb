# frozen_string_literal: true

module Api
  module V1
    class DisbursementsController < BaseApiController
      def index
        merchant = Merchant.find(disbursement_params[:merchant_id]) if disbursement_params[:merchant_id]
        begin_of_the_week = Time.zone.today.beginning_of_week
        end_of_the_week = Time.zone.today.end_of_week

        if merchant
          disbursements = merchant.disbursements.where(created_at: begin_of_the_week..end_of_the_week)
        else
          disbursements = Disbursement.where(created_at: begin_of_the_week..end_of_the_week)
        end

        render json: disbursements
      end

      private

      def disbursement_params
        params.permit(:merchant_id)
      end
    end
  end
end
