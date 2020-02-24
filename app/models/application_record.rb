class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  scope :reverse_scope, -> {
    order(created_at: :desc)
  }

  scope :ransack_query, ->(params, page, per_page = 10) {
    ransack(params).
      result.
      page(page).
      per(per_page)
  }

  class << self
    def to_i18n(column)
      I18n.t("activerecord.notify.#{name.underscore}.#{column}")
    end
  end
end
