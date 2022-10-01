require_relative '../basic_service'
module Ads
  class CreateService
    prepend BasicService

    option :ad do
      option :title
      option :description
      option :city
      option :user_id
    end

    attr_reader :ad

    def call
      @ad = @user.ads.new(@ad.to_h)
      fail!(@ad.errors) unless @ad.save
    end
  end
end
