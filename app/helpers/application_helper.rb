# coding: utf-8
module ApplicationHelper
  def copyright_years
    first_year = 2011
    current_year = Time.now.year
    if current_year > first_year
      "#{first_year}‒#{current_year}"
    else
      first_year
    end
  end

  def title
    @title || "Perk Trees"
  end
end
