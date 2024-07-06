module Api
  class ApplicationController < ::ActionController::API
    private

    def user
      User.find_or_create_by!(email: 'iago_gtr@hotmail.com', password: 'iago1234')
    end
  end
end
