module ProductsHelper
  def star_mark(candidate)
    if candidate.vote_logs_count > 0
      "* #{candidate.vote_logs_count}票"
    else
      "#{candidate.vote_logs_count}票"
    end
  end
end
