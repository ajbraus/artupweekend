class MaterialsController < ApplicationController
  def index
  end

  def faq
    @events = Event.order("starts_at DESC")
  end

  def mentors
  end

  def day_of
  end
end
