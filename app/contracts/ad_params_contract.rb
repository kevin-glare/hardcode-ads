# frozen_string_literal: true

class AdParamsContract < Dry::Validation::Contract
  params do
    required(:ad).hash do
      required(:title).value(:string)
      required(:description).value(:string)
      required(:city).value(:string)
    end
    required(:user_id).value(:integer)
  end
end
