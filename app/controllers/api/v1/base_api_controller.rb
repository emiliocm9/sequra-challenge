# frozen_string_literal: true
module Api
  module V1
    class BaseApiController < ActionController::API
      include ActionController::HttpAuthentication::Token::ControllerMethods
    end
  end
end
