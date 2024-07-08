# frozen_string_literal: true

module Searchable
  extend ActiveSupport::Concern

  class_methods do
    def search_ilike_for(columns, term)
      columns = columns.map { |column| "#{column} ILIKE :t" }
      where(columns.join(' OR '), t: "%#{term}%")
    end
  end
end
