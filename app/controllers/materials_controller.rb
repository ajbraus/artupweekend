class MaterialsController < ApplicationController
  def index
  end

  def faq
    @events = Event.order("starts_at DESC")
  end

  def about_us
  end

  def mentors
  end

  def day_of
  end

  def loi

  end
end
