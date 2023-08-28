# frozen_string_literal: true

module PaginationMethods
  def pagination(total_records)
    {
      page:,
      per_page: limit,
      total: total_records,
      total_pages: total_records.nil? ? 0 : (total_records / limit.to_f).ceil
    }
  end

  def limit
    return 100 if params[:per_page].nil?

    params[:per_page].to_i > 100 ? 100 : params[:per_page].to_i
  end

  def offset
    (page - 1) * limit
  end

  def page
    params[:page].nil? ? 1 : params[:page].to_i
  end
end
