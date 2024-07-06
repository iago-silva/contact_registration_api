# frozen_string_literal: true

module Api
  class ApplicationController < ::ApplicationController
    include DeviseTokenAuth::Concerns::SetUserByToken

    before_action :authenticate_user!
  end
end
