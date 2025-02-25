# frozen_string_literal: true

module Api
  module V1
    class ViaCepController < ApplicationController
      def index
        response = Faraday.get("https://viacep.com.br/ws/#{params[:cep]}/json")

        render json: response.body, status: response.status
      end
    end
  end
end
