module V1::Domain::Pagination
  extend ActiveSupport::Concern

  included do
    scope :pagination, lambda { |p, tot|
      limit(tot).offset(p)
    }
  end

  class_methods do
    def page(page: nil, per_page: nil)
      p = page.present? ? page.to_i - 1 : 0
      p = 0 if p.negative?
      per = per_page.present? ? per_page.to_i : 20
      ofset = (per * p)
      pagination(ofset, per_page)
    end
  end
end
