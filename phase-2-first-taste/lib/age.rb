class Age
  def initialize(years)
    @years = years.to_i
  end

  def adult?
    @years >= 18
  end

  def child?
    @years < 13
  end

  def teenager?
    !adult? && !child?
  end

  def can_vote?
    adult?
  end
end
