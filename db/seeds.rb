# frozen_string_literal: true

ActiveRecord::Base.transaction do
  Rails.logger.debug 'hello'
end
