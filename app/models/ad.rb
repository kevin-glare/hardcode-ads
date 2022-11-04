# frozen_string_literal: true

class Ad < Sequel::Model
  def validate
    super

    validates_presence :city, message: I18n.t(:blank, scope: 'model.errors.ad.city')
    validates_presence :title, message: I18n.t(:blank, scope: 'model.errors.ad.title')
    validates_presence :description, message: I18n.t(:blank, scope: 'model.errors.ad.description')
  end

  # after_commit :set_coordinates, on: :create

  def after_create
    super
    db.after_commit{ Geocoders::SetCoordinateSerivice.(ad: self) }
  end
end
